import type { ConstantDecl, ConstantDef, Expression } from "@/next/ast";
import type { Id } from "@/next/ast/common";
import type { Var } from "@/next/ast/expression";
import type { TactSource } from "@/next/imports/source";

const ensureMap = <K, V>(m: Map<K, V>, k: K, v: V): V => {
    const prev = m.get(k);
    if (prev) {
        return prev;
    } else {
        const x = {...v};
        m.set(k, x);
        return x;
    }
};

// constDefs: Map<TactSource, ConstantDef[]>
// freeVars: Map<Expression, Var[]>
// varsInConst: Map<ConstantDef, Var[]>

// TactSource . items . ConstantDef . Expr/Var . name . !(TactSource . items . ConstantDef . name)
// TactSource . items . ConstantDef . name . !(TactSource . items . ConstantDef . name)
// TactSource . items . ConstantDef . (Expr/Var . name . !(ConstantDef . name))* . name

type GlobalEnv = {
    readonly freeVars: Map<Expression, Set<Name>>;
    readonly definedConsts: Set<ConstantDef>;
    readonly constDefByName: Map<Name, ConstantDef[]>;
    readonly transitiveUse: Map<ConstantDef, ConstantDef[]>;
}

// const x = (Foo {}).y;
// struct Foo {
//     y: Int as int32 = x;
// }


type Env = Map<Name, {
    readonly definedBy: Set<Id>;
    readonly usedBy: Set<Id>;
}>
const empty = {
    definedBy: new Set<Id>(),
    usedBy: new Set<Id>(),
} as const;
const define = (env: Env, id: Id) => ensureMap(env, id.text, empty).definedBy.add(id);
const use = (env: Env, id: Id) => ensureMap(env, id.text, empty).usedBy.add(id);

// const c1 = 42;
// const c2 = c1 + 5;

type Name = string;
interface Scope {
    readonly constants: Env;
    readonly children: Scope[];
}
const Scope = (parent?: Scope): Scope => {
    const scope: Scope = { constants: new Map(), children: [] };
    parent?.children.push(scope);
    return scope;
};

export const resolve = (node: TactSource) => {
    const global = Scope()
    resolveTop(node, global);
    // TODO: flatten scope
    const flatGlobal = global;
    checkDefinedOnce(flatGlobal);
    checkSortable(flatGlobal);
};

const checkDefinedOnce = (scope: Scope) => {
    for (const { definedBy, usedBy } of scope.constants.values()) {
        if (definedBy.size === 0) {
            for (const use of usedBy) {
                console.error(`Constant was not defined ${use.loc.start}`);
            }
        } else if (definedBy.size > 1) {
            for (const def of definedBy) {
                console.error(`Constant was already defined ${def.loc.start}`);
            }
        }
    }
}

const checkSortable = (scope: Scope) => {
    scope.constants
};

const resolveTop = ({ items }: TactSource, scope: Scope) => {
    for (const item of items) {
        switch (item.kind) {
            case "constant_def": {
                const { attributes: _a, initializer, name, type } = item;
                define(scope.constants, name);
                const child = resolveExpr(initializer, scope);
                return;
            }
            case "function_def":
            case "asm_function_def":
            case "native_function_decl":
                return;
            case "struct_decl":
            case "message_decl":
            case "union_decl":
            case "alias_decl":
            case "contract":
            case "trait":
                return;
        }
    }
};

const resolveExpr = (root: Expression, parentScope: Scope) => {
    const scope = Scope(parentScope);
    const recAll = (nodes: readonly Expression[]) => {
        for (const node of nodes) {
            rec(node);
        }
    };
    const rec = (node: Expression) => {
        switch (node.kind) {
            case "var":
                use(scope.constants, node.name);
                return;
            case "string":
            case "number":
            case "boolean":
                return;
            case "op_binary":
                rec(node.left);
                rec(node.right);
                return;
            case "op_unary":
                rec(node.operand);
                return;
            case "conditional":
                rec(node.condition);
                rec(node.thenBranch);
                rec(node.elseBranch);
                return;
            case "method_call":
                rec(node.self);
                recAll(node.args);
                return;
            case "field_access":
                rec(node.aggregate);
                return;
            case "static_call":
                recAll(node.args);
                return;
            case "struct_instance":
                recAll(node.args.map(x => x.initializer));
                return;
            case "init_of":
                recAll(node.args);
                return;
            case "code_of":
                return;
            case "null":
                return;
            case "unit":
                return;
            case "tuple":
                recAll(node.children);
                return;
            case "tensor":
                recAll(node.children);
                return;
            case "map_literal":
                recAll(node.fields.flatMap(({ key, value }) => [key, value]));
                return;
            case "set_literal":
                recAll(node.fields);
                return;
        }
    };
    rec(root);
    return scope;
};