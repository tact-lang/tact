import * as $ from '@langtools/runtime';
import * as A from "../ast";
import * as G from './grammar';
import type { $$ } from './grammar';
import { TactCompilationError, throwInternalCompilerError } from '../../errors';
import { SyntaxErrors, syntaxErrorSchema } from '../parser-error';
import { AstSchema, getAstSchema, Location } from '../ast-typed';
import { makeVisitor } from './util';
import { getSrcInfo, ItemOrigin } from '../src-info';
import { displayToString } from '../../error/display-to-string';

type Context = {
    ast: AstSchema;
    err: SyntaxErrors<(loc: $.Location) => never>;
}

type Handler<T> = (ctx: Context) => T;

const map = <T, U>(ts: readonly T[], handler: (t: T) => Handler<U>): Handler<U[]> => (ctx) => {
    return ts.map(t => handler(t)(ctx));
};

const parseList = <T>(node: $$.inter<T, unknown> | undefined): T[] => {
    if (!node) {
        return [];
    }
    const { head, tail } = node;
    return [head, ...tail.map(({ right }) => right)];
};

const parseId = ({ name, loc }: $$.Id | $$.TypeId): Handler<A.AstId> => (ctx) => {
    if (name.startsWith("__gen")) {
        ctx.err.reservedVarPrefix("__gen")(loc);
    }
    if (name.startsWith("__tact")) {
        ctx.err.reservedVarPrefix("__tact")(loc);
    }
    return ctx.ast.Id(name, loc);
};

const parseFuncId = ({ accessor, id, loc }: $$.FuncId): Handler<A.AstFuncId> => (ctx) => {
    return ctx.ast.FuncId(accessor + id, loc);
};

const baseMap = {
    IntegerLiteralBin: 2,
    IntegerLiteralOct: 8,
    IntegerLiteralDec: 10,
    IntegerLiteralHex: 16,
} as const;

const prefixMap = {
    IntegerLiteralBin: '0b',
    IntegerLiteralOct: '0o',
    IntegerLiteralDec: '',
    IntegerLiteralHex: '0x',
} as const;

const parseIntegerLiteralValue = ({ $, digits, loc }: $$.IntegerLiteral["value"]): Handler<A.AstNumber> => (ctx) => {
    const value = BigInt(prefixMap[$] + digits.replaceAll("_", ""))
    return ctx.ast.Number(baseMap[$], value, loc);
};

const parseIntegerLiteral = ({ value }: $$.IntegerLiteral): Handler<A.AstNumber> => (ctx) => {
    return parseIntegerLiteralValue(value)(ctx);
};

const parseStringLiteral = ({ value, loc }: $$.StringLiteral): Handler<A.AstString> => (ctx) => {
    return ctx.ast.String(value, loc);
};

const parseBoolLiteral = ({ value, loc }: $$.BoolLiteral): Handler<A.AstBoolean> => (ctx) => {
    return ctx.ast.Boolean(value === "true", loc);
};

const parseNull = ({ loc }: $$.Null): Handler<A.AstNull> => (ctx) => {
    return ctx.ast.Null(loc);
};

const parseStructFieldInitializer = ({ name, init, loc }: $$.StructFieldInitializer): Handler<A.AstStructFieldInitializer> => (ctx) => {
    const fieldId = parseId(name)(ctx);

    return ctx.ast.StructFieldInitializer(
        fieldId,
        init ? parseExpression(init)(ctx) : fieldId,
        loc,
    );
};

const parseStructInstance = ({ type, fields, loc }: $$.StructInstance): Handler<A.AstStructInstance> => (ctx) => {
    return ctx.ast.StructInstance(
        parseId(type)(ctx),
        map(parseList(fields), parseStructFieldInitializer)(ctx),
        loc,
    );
};

const parseInitOf = ({ name, params, loc }: $$.InitOf): Handler<A.AstInitOf> => (ctx) => {
    return ctx.ast.InitOf(
        parseId(name)(ctx),
        map(parseList(params), parseExpression)(ctx),
        loc,
    );
};

const parseConditional = ({ head, tail, loc }: $$.Conditional): Handler<A.AstExpression> => (ctx) => {
    const condition = parseExpression(head)(ctx);
    if (!tail) {
        return condition;
    }
    const { thenBranch, elseBranch } = tail;
    return ctx.ast.Conditional(
        condition,
        parseExpression(thenBranch)(ctx),
        parseExpression(elseBranch)(ctx),
        loc,
    );
};

const parseBinary = (
    { exprs: { head, tail } }: $$.Binary<Expression, A.AstBinaryOperation>
): Handler<A.AstExpression> => (ctx) => {
    return tail.reduce((left, { op: { name, loc }, right }) => (
        ctx.ast.OpBinary(name, left, parseExpression(right)(ctx), loc)
    ), parseExpression(head)(ctx))
};

const parseUnary = ({ prefixes, expression }: $$.Unary): Handler<A.AstExpression> => (ctx) => {
    return prefixes.reduceRight((child, { name, loc }) => {
        return ctx.ast.OpUnary(name, child, loc);
    }, parseExpression(expression)(ctx));
};

type SuffixHandler = Handler<(child: A.AstExpression) => A.AstExpression>

const parseSuffixUnboxNotNull = ({ loc }: $$.SuffixUnboxNotNull): SuffixHandler => (ctx) => (child) => {
    return ctx.ast.OpUnary("!!", child, loc);
};

const parseSuffixCall = ({ params, loc }: $$.SuffixCall): SuffixHandler => (ctx) => (child) => {
    if (child.kind === 'id') {
        return ctx.ast.StaticCall(
            child,
            map(parseList(params), parseExpression)(ctx),
            loc,
        );
    } else if (child.kind === 'field_access') {
        return ctx.ast.MethodCall(
            child.aggregate,
            child.field,
            map(parseList(params), parseExpression)(ctx),
            loc,
        );
    } else {
        ctx.err.notCallable()(loc);
        return ctx.ast.StaticCall(
            ctx.ast.Id('__invalid__', loc),
            map(parseList(params), parseExpression)(ctx),
            loc,
        );
    }
};

const parseSuffixFieldAccess = ({ name, loc }: $$.SuffixFieldAccess): SuffixHandler => (ctx) => (child) => {
    return ctx.ast.FieldAccess(child, parseId(name)(ctx), loc);
};

const suffixVisitor: (node: $$.suffix) => SuffixHandler
    = makeVisitor<$$.suffix>()({
        SuffixUnboxNotNull: parseSuffixUnboxNotNull,
        SuffixCall: parseSuffixCall,
        SuffixFieldAccess: parseSuffixFieldAccess,
    });

const parseSuffix = ({ expression, suffixes }: $$.Suffix): Handler<A.AstExpression> => (ctx) => {
    return suffixes.reduce((child, suffix) => {
        return suffixVisitor(suffix)(ctx)(child);
    }, parseExpression(expression)(ctx));
};

const parseParens = ({ child }: $$.Parens): Handler<A.AstExpression> => {
    return parseExpression(child);
};

// has to be an interface because of the way TS handles circular type references
interface Binary extends $$.Binary<Expression, A.AstBinaryOperation> {}

type Expression =
    | $$.Conditional
    | Binary
    | $$.Unary
    | $$.Suffix
    | $$.Parens
    | $$.StructInstance
    | $$.IntegerLiteral
    | $$.BoolLiteral
    | $$.InitOf
    | $$.Null
    | $$.StringLiteral
    | $$.Id;

const parseExpression: (input: Expression) => Handler<A.AstExpression> =
    makeVisitor<Expression>()({
        Conditional: parseConditional,
        Binary: parseBinary,
        Unary: parseUnary,
        Suffix: parseSuffix,
        Parens: parseParens,
        StructInstance: parseStructInstance,
        IntegerLiteral: parseIntegerLiteral,
        BoolLiteral: parseBoolLiteral,
        InitOf: parseInitOf,
        Null: parseNull,
        StringLiteral: parseStringLiteral,
        Id: parseId,
    });

const parseStatementLet = ({ name, type, init, loc }: $$.StatementLet): Handler<A.AstStatementLet> => (ctx) => {
    return ctx.ast.StatementLet(
        parseId(name)(ctx),
        type ? parseType(type)(ctx) : null,
        parseExpression(init)(ctx),
        loc,
    );
};

const parseStatementBlock = (_node: $$.StatementBlock): Handler<never> => () => {
    // TODO: process StatementBlock
    throwInternalCompilerError('Block statements are not supported');
};

const parseStatementReturn = ({ expression, loc }: $$.StatementReturn): Handler<A.AstStatementReturn> => (ctx) => {
    return ctx.ast.StatementReturn(
        expression ? parseExpression(expression)(ctx) : null,
        loc,
    );
};

const parseStatementCondition = ({ condition, trueBranch, falseBranch, loc }: $$.StatementCondition): Handler<A.AstCondition> => (ctx) => {
    if (typeof falseBranch === 'undefined') {
        return ctx.ast.Condition(
            parseExpression(condition)(ctx),
            parseStatements(trueBranch)(ctx),
            null,
            null,
            loc,
        );
    } else if (falseBranch.$ === 'FalseBranch') {
        return ctx.ast.Condition(
            parseExpression(condition)(ctx),
            parseStatements(trueBranch)(ctx),
            parseStatements(falseBranch.body)(ctx),
            null,
            loc,
        );
    } else {
        return ctx.ast.Condition(
            parseExpression(condition)(ctx),
            parseStatements(trueBranch)(ctx),
            null,
            parseStatementCondition(falseBranch)(ctx),
            loc,
        );
    }
};

const parseStatementWhile = ({ condition, body, loc }: $$.StatementWhile): Handler<A.AstStatementWhile> => (ctx) => {
    return ctx.ast.StatementWhile(
        parseExpression(condition)(ctx),
        parseStatements(body)(ctx),
        loc,
    );
};

const parseStatementRepeat = ({ condition, body, loc }: $$.StatementRepeat): Handler<A.AstStatementRepeat> => (ctx) => {
    return ctx.ast.StatementRepeat(
        parseExpression(condition)(ctx),
        parseStatements(body)(ctx),
        loc,
    );
};

const parseStatementUntil = ({ condition, body, loc }: $$.StatementUntil): Handler<A.AstStatementUntil> => (ctx) => {
    return ctx.ast.StatementUntil(
        parseExpression(condition)(ctx),
        parseStatements(body)(ctx),
        loc,
    );
};

const parseStatementTry = ({ body, handler, loc }: $$.StatementTry): Handler<A.AstStatementTry | A.AstStatementTryCatch> => (ctx) => {
    if (handler) {
        return ctx.ast.StatementTryCatch(
            parseStatements(body)(ctx),
            parseId(handler.name)(ctx),
            parseStatements(handler.body)(ctx),
            loc,
        );
    } else {
        return ctx.ast.StatementTry(
            parseStatements(body)(ctx),
            loc,
        );
    }
};

const parseStatementForEach = ({ key, value, expression, body, loc }: $$.StatementForEach): Handler<A.AstStatementForEach> => (ctx) => {
    return ctx.ast.StatementForEach(
        parseId(key)(ctx),
        parseId(value)(ctx),
        parseExpression(expression)(ctx),
        parseStatements(body)(ctx),
        loc,
    );
};

const parseStatementExpression = ({ expression, loc }: $$.StatementExpression): Handler<A.AstStatementExpression> => (ctx) => {
    return ctx.ast.StatementExpression(parseExpression(expression)(ctx), loc);
};

const parseStatementAssign = ({ left, operator, right, loc }: $$.StatementAssign): Handler<A.AstStatementAssign | A.AstStatementAugmentedAssign> => (ctx) => {
    if (typeof operator === 'undefined') {
        return ctx.ast.StatementAssign(
            parseExpression(left)(ctx),
            parseExpression(right)(ctx),
            loc,
        );
    } else {
        return ctx.ast.StatementAugmentedAssign(
            operator,
            parseExpression(left)(ctx),
            parseExpression(right)(ctx),
            loc,
        );
    }
};

const parseStatement: (node: $$.statement) => Handler<A.AstStatement> =
    makeVisitor<$$.statement>()({
        StatementLet: parseStatementLet,
        StatementBlock: parseStatementBlock,
        StatementReturn: parseStatementReturn,
        StatementCondition: parseStatementCondition,
        StatementWhile: parseStatementWhile,
        StatementRepeat: parseStatementRepeat,
        StatementUntil: parseStatementUntil,
        StatementTry: parseStatementTry,
        StatementForEach: parseStatementForEach,
        StatementExpression: parseStatementExpression,
        StatementAssign: parseStatementAssign,
    });

const parseStatements = (nodes: readonly $$.statement[]): Handler<A.AstStatement[]> => (ctx) => {
    return map(nodes, parseStatement)(ctx);
};

const parseFunctionAttribute = (node: $$.FunctionAttribute): Handler<A.AstFunctionAttribute> => (ctx) => {
    if (typeof node.name === 'string') {
        return ctx.ast.FunctionAttribute(node.name, node.loc);
    }

    return ctx.ast.FunctionAttributeGet(
        node.name.methodId ? parseExpression(node.name.methodId)(ctx) : null,
        node.loc,
    );
};

const checkAttributes =
    (kind: "constant" | "function") =>
    (
        ctx: Context,
        isAbstract: boolean,
        attributes: readonly ($$.FunctionAttribute | $$.ConstantAttribute)[],
        loc: Location,
    ) => {
        const { duplicate, tooAbstract, notAbstract } = ctx.err[kind];
        const k: Set<string> = new Set();
        for (const { name, loc } of attributes) {
            const type = typeof name === 'string' ? name : name.$;
            if (k.has(type)) {
                duplicate(type)(loc);
            }
            k.add(type);
        }
        if (isAbstract && !k.has("abstract")) {
            notAbstract()(loc);
        }
        if (!isAbstract && k.has("abstract")) {
            tooAbstract()(loc);
        }
    };

const parseFunctionAttributes = (nodes: readonly $$.FunctionAttribute[], isAbstract: boolean, loc: $.Location): Handler<A.AstFunctionAttribute[]> => (ctx) => {
    checkAttributes("function")(ctx, isAbstract, nodes, loc);
    return map(nodes, parseFunctionAttribute)(ctx);
};

const parseConstantAttribute = ({ name, loc }: $$.ConstantAttribute): Handler<A.AstConstantAttribute> => (ctx) => {
    return ctx.ast.ConstantAttribute(name, loc);
};

const parseConstantAttributes = (nodes: readonly $$.ConstantAttribute[], isAbstract: boolean, loc: $.Location): Handler<A.AstConstantAttribute[]> => (ctx) => {
    checkAttributes("constant")(ctx, isAbstract, nodes, loc);
    return map(nodes, parseConstantAttribute)(ctx);
};

const parseParameter = ({ name, type, loc }: $$.Parameter): Handler<A.AstTypedParameter> => (ctx) => {
    return ctx.ast.TypedParameter(parseId(name)(ctx), parseType(type)(ctx), loc);
};

const parseTypeId = ({ name, loc }: $$.TypeId): Handler<A.AstTypeId> => (ctx) => {
    return ctx.ast.TypeId(name, loc);
};

const parseTypeOptional = ({ child, loc }: $$.TypeOptional): Handler<A.AstType> => (ctx) => {
    return ctx.ast.OptionalType(parseTypeId(child)(ctx), loc);
};

const parseTypeRegular = ({ child }: $$.TypeRegular): Handler<A.AstType> => (ctx) => {
    return parseTypeId(child)(ctx);
};

const parseTypeMap = ({ key, keyAs, value, valueAs, loc }: $$.TypeMap): Handler<A.AstType> => (ctx) => {
    return ctx.ast.MapType(
        parseTypeId(key)(ctx),
        keyAs ? parseId(keyAs)(ctx) : null,
        parseTypeId(value)(ctx),
        valueAs ? parseId(valueAs)(ctx) : null,
        loc,
    );
};

const parseTypeBounced = ({ child, loc }: $$.TypeBounced): Handler<A.AstType> => (ctx) => {
    return ctx.ast.BouncedMessageType(parseTypeId(child)(ctx), loc);
};

const parseType: (input: $$.$type) => Handler<A.AstType> =
    makeVisitor<$$.$type>()({
        TypeBounced: parseTypeBounced,
        TypeMap: parseTypeMap,
        TypeOptional: parseTypeOptional,
        TypeRegular: parseTypeRegular,
    });

const parseFieldDecl = ({ name, as, type, expression, loc }: $$.FieldDecl): Handler<A.AstFieldDecl> => (ctx) => {
    return ctx.ast.FieldDecl(
        parseId(name)(ctx),
        parseType(type)(ctx),
        expression ? parseExpression(expression)(ctx) : null,
        as ? parseId(as)(ctx) : null,
        loc,
    );
};

const parseReceiverReceive = ({ param, body, loc }: $$.Receiver): Handler<A.AstReceiver> => (ctx) => {
    const selector: A.AstReceiverKind = !param
        ? { kind: "internal-fallback" }
        : param.$ === 'Parameter'
        ? {
              kind: "internal-simple",
              param: parseParameter(param)(ctx),
          }
        : {
            kind: "internal-comment",
            comment: parseStringLiteral(param)(ctx),
        };

    return ctx.ast.Receiver(selector, map(body, parseStatement)(ctx), loc);
};

const parseReceiverExternal = ({ param, body, loc }: $$.Receiver): Handler<A.AstReceiver> => (ctx) => {
    const selector: A.AstReceiverKind = !param
        ? { kind: "external-fallback" }
        : param.$ === 'Parameter'
        ? {
              kind: "external-simple",
              param: parseParameter(param)(ctx),
          }
        : {
            kind: "external-comment",
            comment: parseStringLiteral(param)(ctx),
        };

    return ctx.ast.Receiver(selector, map(body, parseStatement)(ctx), loc);
};

const repairParam: $$.receiverParam = {
    $: "Parameter",
    name: {
        $: 'Id',
        name: '__invalid__',
        loc: [0, 0],
    },
    type: {
        $: 'TypeRegular',
        child: {
            $: 'TypeId',
            name: '__Invalid__',
            loc: [0, 0],
        },
        loc: [0, 0],
    },
    loc: [0, 0],
};

const parseReceiverBounced = ({ param, body, loc }: $$.Receiver): Handler<A.AstReceiver> => (ctx) => {
    if (typeof param === 'undefined') {
        ctx.err.noBouncedWithoutArg()(loc);
        param = repairParam;
    }

    if (param.$ === 'StringLiteral') {
        ctx.err.noBouncedWithString()(loc);
        param = repairParam;
    }

    const selector: A.AstReceiverKind = {
        kind: "bounce",
        param: parseParameter(param)(ctx),
    };

    return ctx.ast.Receiver(selector, map(body, parseStatement)(ctx), loc);
};

const parserByReceiverType: Record<$$.receiverType, (node: $$.Receiver) => Handler<A.AstReceiver>> = {
    bounced: parseReceiverBounced,
    receive: parseReceiverReceive,
    external: parseReceiverExternal,
};

const parseReceiver = (node: $$.Receiver): Handler<A.AstReceiver> => {
    return parserByReceiverType[node.type](node);
};

const defaultShuffle = {
    args: [],
    ret: [],
};

const parseAsmShuffle = (node: $$.shuffle | undefined): Handler<A.AstAsmShuffle> => (ctx) => {
    if (!node) {
        return defaultShuffle;
    }

    return {
        args: map(node.ids, parseId)(ctx),
        ret: node.to ? map(node.to, parseIntegerLiteralValue)(ctx) : [],
    };
}

const parseAsmFunction = (node: $$.AsmFunction): Handler<A.AstAsmFunctionDef> => (ctx) => {
    return ctx.ast.AsmFunctionDef(
        parseAsmShuffle(node.shuffle)(ctx),
        parseFunctionAttributes(node.attributes, false, node.loc)(ctx),
        parseId(node.name)(ctx),
        node.returnType ? parseType(node.returnType)(ctx) : null,
        map(parseList(node.parameters), parseParameter)(ctx),
        node.instructions,
        node.loc,
    );
};

const parseContractInit = ({ parameters, body, loc }: $$.ContractInit): Handler<A.AstContractInit> => (ctx) => {
    return ctx.ast.ContractInit(
        map(parseList(parameters), parseParameter)(ctx),
        map(body, parseStatement)(ctx),
        loc,
    );
};

const parseConstantDefInModule = (node: $$.Constant): Handler<A.AstConstantDef> => (ctx) => {
    const result = parseConstantDef(node)(ctx);
    const firstAttribute = result.attributes[0];
    if (typeof firstAttribute !== 'undefined') {
        ctx.err.topLevelConstantWithAttribute()(node.loc);
        result.attributes = [];
    }
    return result;
};

const parseConstantDef = (node: $$.Constant): Handler<A.AstConstantDef> => (ctx) => {
    const result = parseConstant(node)(ctx);

    if (result.kind !== 'constant_def') {
        ctx.err.noConstantDecl()(node.loc);
        return {
            ...parseConstant(node)(ctx),
            kind: 'constant_def',
            initializer: ctx.ast.Number(10, 0n, node.loc),
        };
    }

    return result;
};

const parseConstant = (node: $$.Constant): Handler<A.AstConstantDecl | A.AstConstantDef> => (ctx) => {
    const name = parseId(node.name)(ctx);
    const type = parseType(node.type)(ctx);

    if (node.body.$ === 'ConstantDeclaration') {
        const attributes = parseConstantAttributes(node.attributes, true, node.loc)(ctx);
        return ctx.ast.ConstantDecl(attributes, name, type, node.loc);
    } else {
        const attributes = parseConstantAttributes(node.attributes, false, node.loc)(ctx);
        const initializer = parseExpression(node.body.expression)(ctx);
        return ctx.ast.ConstantDef(attributes, name, type, initializer, node.loc);
    }
};

const parseContract = ({ name, attributes, traits, declarations, loc }: $$.Contract): Handler<A.AstContract> => (ctx) => {
    return ctx.ast.Contract(
        parseId(name)(ctx),
        map(parseList(traits), parseId)(ctx),
        map(attributes, parseContractAttribute)(ctx),
        map(declarations, parseContractItem)(ctx),
        loc,
    );
};

const parseFunctionDef = (node: $$.$Function): Handler<A.AstFunctionDef> => (ctx) => {
    const result = parseFunction(node)(ctx);

    if (result.kind !== 'function_def') {
        ctx.err.noFunctionDecl()(node.loc);
        return {
            ...parseFunction(node)(ctx),
            kind: 'function_def',
            statements: [],
        };
    }

    return result;
};

const parseFunction = (node: $$.$Function): Handler<A.AstFunctionDef | A.AstFunctionDecl> => (ctx) => {
    const name = parseId(node.name)(ctx);
    const returnType = node.returnType ? parseType(node.returnType)(ctx) : null;
    const parameters = map(parseList(node.parameters), parseParameter)(ctx);

    if (node.body.$ === 'FunctionDeclaration') {
        const attributes = parseFunctionAttributes(node.attributes, true, node.loc)(ctx);
        return ctx.ast.FunctionDecl(attributes, name, returnType, parameters, node.loc);
    } else {
        const attributes = parseFunctionAttributes(node.attributes, false, node.loc)(ctx);
        const statements = map(node.body.body, parseStatement)(ctx);
        return ctx.ast.FunctionDef(attributes, name, returnType, parameters, statements, node.loc);
    }
};

const parseMessageDecl = ({ name, opcode, fields, loc }: $$.MessageDecl): Handler<A.AstMessageDecl> => (ctx) => {
    return ctx.ast.MessageDecl(
        parseId(name)(ctx),
        opcode ? parseIntegerLiteral(opcode)(ctx) : null,
        map(parseList(fields), parseFieldDecl)(ctx),
        loc,
    );
};

const parseNativeFunctionDecl = ({ name, attributes, nativeName, parameters, returnType, loc }: $$.NativeFunctionDecl): Handler<A.AstNativeFunctionDecl> => (ctx) => {
    return ctx.ast.NativeFunctionDecl(
        map(attributes, parseFunctionAttribute)(ctx),
        parseId(name)(ctx),
        parseFuncId(nativeName)(ctx),
        map(parseList(parameters), parseParameter)(ctx),
        returnType ? parseType(returnType)(ctx) : null,
        loc,
    );
};

const parsePrimitiveTypeDecl = ({ name, loc }: $$.PrimitiveTypeDecl): Handler<A.AstPrimitiveTypeDecl> => (ctx) => {
    return ctx.ast.PrimitiveTypeDecl(parseId(name)(ctx), loc);
};

const parseStructDecl = ({ name, fields, loc }: $$.StructDecl): Handler<A.AstStructDecl> => (ctx) => {
    return ctx.ast.StructDecl(
        parseId(name)(ctx),
        map(parseList(fields), parseFieldDecl)(ctx),
        loc,
    );
};

const parseContractAttribute = ({ name, loc }: $$.ContractAttribute): Handler<A.AstContractAttribute> => ctx => {
    return ctx.ast.ContractAttribute(
        parseStringLiteral(name)(ctx),
        loc,
    );
};

const parseTrait = ({ name, traits, attributes, declarations, loc }: $$.Trait): Handler<A.AstTrait> => (ctx) => {
    return ctx.ast.Trait(
        parseId(name)(ctx),
        traits ? map(parseList(traits), parseId)(ctx) : [],
        map(attributes, parseContractAttribute)(ctx),
        map(declarations, parseTraitItem)(ctx),
        loc,
    );
};

const parseContractItem: (input: $$.contractItemDecl) => Handler<A.AstContractDeclaration> =
    makeVisitor<$$.contractItemDecl>()({
        ContractInit: parseContractInit,
        FieldDecl: parseFieldDecl,
        Receiver: parseReceiver,
        Function: parseFunctionDef,
        Constant: parseConstantDef,
    });

const parseTraitItem: (input: $$.traitItemDecl) => Handler<A.AstTraitDeclaration> =
    makeVisitor<$$.traitItemDecl>()({
        FieldDecl: parseFieldDecl,
        Receiver: parseReceiver,
        Function: parseFunction,
        Constant: parseConstant,
    });

const parseModuleItem: (input: $$.moduleItem) => Handler<A.AstModuleItem> =
    makeVisitor<$$.moduleItem>()({
        PrimitiveTypeDecl: parsePrimitiveTypeDecl,
        Function: parseFunctionDef,
        AsmFunction: parseAsmFunction,
        NativeFunctionDecl: parseNativeFunctionDecl,
        Constant: parseConstantDefInModule,
        StructDecl: parseStructDecl,
        MessageDecl: parseMessageDecl,
        Contract: parseContract,
        Trait: parseTrait,
    });

const parseImport = ({ path, loc }: $$.Import): Handler<A.AstImport> => (ctx) => {
    if (path.value.includes("\\")) {
        ctx.err.importWithBackslash()(loc);
        path = { ...path, value: path.value.replace(/\\/g, '/') };
    }

    return ctx.ast.Import(parseStringLiteral(path)(ctx), loc);
};

const parseModule = ({ imports, items }: $$.Module): Handler<A.AstModule> => (ctx) => {
    return ctx.ast.Module(
        map(imports, parseImport)(ctx),
        map(items, parseModuleItem)(ctx),
    );
};

const parseJustImports = ({ imports }: $$.JustImports): Handler<A.AstImport[]> => (ctx) => {
    return map(imports, parseImport)(ctx);
};

export const getParser = (ast: A.FactoryAst) => {
    const display = displayToString;

    const doParse = <T, U>(Parser: $.Parser<T>, handler: (t: T) => Handler<U>, src: string, path: string, origin: ItemOrigin) => {
        const locationToSrcInfo = ([start, end]: $.Location) => {
            return getSrcInfo(src, start, end, path, origin);
        };
        const err = syntaxErrorSchema(display, (message: string) => (source: Location) => {
            const srcInfo = locationToSrcInfo(source);
            throw new TactCompilationError(display.at(srcInfo, message), srcInfo);
        });

        const result = $.parse(Parser, src);
        if (result.$ === 'error') {
            const { expected, position } = result.error;
            return err.expected(expected)([position, position]);
        }
        const ctx = {
            ast: getAstSchema(ast, locationToSrcInfo),
            err,
        };
        return handler(result.value)(ctx);
    };

    return {
        parse: (src: string, path: string, origin: ItemOrigin): A.AstModule => {
            return doParse(G.Module, parseModule, src, path, origin);
        },
        parseExpression: (src: string): A.AstExpression => {
            return doParse(G.expression, parseExpression, src, '<repl>', 'user');
        },
        parseImports: (src: string, path: string, origin: ItemOrigin): A.AstImport[] => {
            return doParse(G.JustImports, parseJustImports, src, path, origin);
        },
    };
};