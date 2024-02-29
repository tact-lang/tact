import rawGrammar from './grammar.ohm-bundle';
import { ASTConstantAttribute, ASTContractAttribute, ASTFunctionAttribute, ASTNode, ASTProgram, ASTRef, ASTString, ASTTypeRef, createNode, createRef, inFile, throwError } from './ast';
import { checkVariableName } from './checkVariableName';
import { TactSyntaxError } from './../errors';
import { MatchResult } from 'ohm-js';
import { TypeOrigin } from '../types/types';
import { checkFunctionAttributes } from './checkFunctionAttributes';
import { checkConstAttributes } from './checkConstAttributes';

let ctx: { origin: TypeOrigin } | null;

// Semantics
const semantics = rawGrammar.createSemantics();

// Resolve program
semantics.addOperation<ASTNode>('resolve_program', {
    Program(arg0) {
        return createNode({
            kind: 'program',
            entries: arg0.children.map((v) => v.resolve_program_item())
        });
    },
});

// Resolve program items
semantics.addOperation<ASTNode>('resolve_program_item', {
    ProgramImport(_arg0, arg1, _arg2) {
        const pp = arg1.resolve_expression() as ASTString;
        if (pp.value.indexOf('\\') >= 0) {
            throwError('Import path can\'t contain "\\"', createRef(arg1));
        }
        return createNode({
            kind: 'program_import',
            path: arg1.resolve_expression(),
            ref: createRef(this)
        });
    },
    Primitive(_arg0, arg1, _arg2) {
        checkVariableName(arg1.sourceString, createRef(arg1));
        return createNode({
            kind: 'primitive',
            origin: ctx!.origin,
            name: arg1.sourceString,
            ref: createRef(this)
        });
    },
    Struct_originary(_arg0, arg1, _arg2, arg3, _arg4) {
        checkVariableName(arg1.sourceString, createRef(arg1));
        return createNode({
            kind: 'def_struct',
            origin: ctx!.origin,
            name: arg1.sourceString,
            fields: arg3.children.map((v) => v.resolve_declaration()),
            prefix: null,
            message: false,
            ref: createRef(this)
        })
    },
    Struct_message(_arg0, arg1, _arg2, arg3, _arg4) {
        checkVariableName(arg1.sourceString, createRef(arg1));
        return createNode({
            kind: 'def_struct',
            origin: ctx!.origin,
            name: arg1.sourceString,
            fields: arg3.children.map((v) => v.resolve_declaration()),
            prefix: null,
            message: true,
            ref: createRef(this)
        })
    },
    Struct_messageWithId(_arg0, arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7) {
        checkVariableName(arg1.sourceString, createRef(arg1));
        return createNode({
            kind: 'def_struct',
            origin: ctx!.origin,
            name: arg4.sourceString,
            fields: arg6.children.map((v) => v.resolve_declaration()),
            prefix: parseInt(arg2.sourceString),
            message: true,
            ref: createRef(this)
        })
    },
    Contract_simple(arg0, _arg1, arg2, _arg3, arg4, _arg5) {
        checkVariableName(arg2.sourceString, createRef(arg2));
        return createNode({
            kind: 'def_contract',
            origin: ctx!.origin,
            name: arg2.sourceString,
            attributes: arg0.children.map((v) => v.resolve_contract_attributes()),
            declarations: arg4.children.map((v) => v.resolve_declaration()),
            traits: [],
            ref: createRef(this)
        })
    },
    Contract_withTraits(arg0, _arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7) {
        checkVariableName(arg2.sourceString, createRef(arg2));
        return createNode({
            kind: 'def_contract',
            origin: ctx!.origin,
            name: arg2.sourceString,
            attributes: arg0.children.map((v) => v.resolve_contract_attributes()),
            declarations: arg6.children.map((v) => v.resolve_declaration()),
            traits: arg4.asIteration().children.map((v) => v.resolve_expression()),
            ref: createRef(this)
        })
    },
    Trait_originary(arg0, _arg1, arg2, _arg3, arg4, _arg5) {
        checkVariableName(arg2.sourceString, createRef(arg2));
        return createNode({
            kind: 'def_trait',
            origin: ctx!.origin,
            name: arg2.sourceString,
            attributes: arg0.children.map((v) => v.resolve_contract_attributes()),
            declarations: arg4.children.map((v) => v.resolve_declaration()),
            traits: [],
            ref: createRef(this)
        })
    },
    Trait_withTraits(arg0, _arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7) {
        checkVariableName(arg2.sourceString, createRef(arg2));
        return createNode({
            kind: 'def_trait',
            origin: ctx!.origin,
            name: arg2.sourceString,
            attributes: arg0.children.map((v) => v.resolve_contract_attributes()),
            declarations: arg6.children.map((v) => v.resolve_declaration()),
            traits: arg4.asIteration().children.map((v) => v.resolve_expression()),
            ref: createRef(this)
        })
    },
    StaticFunction(arg0) {
        return arg0.resolve_declaration();
    },
    NativeFunction(arg0) {
        return arg0.resolve_declaration();
    },
    Constant_withValue(arg0, _arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7) {
        const attributes = arg0.children.map((v) => v.resolve_const_attributes()) as ASTConstantAttribute[];
        checkConstAttributes(false, attributes, createRef(this));
        return createNode({
            kind: 'def_constant',
            name: arg2.sourceString,
            type: arg4.resolve_expression(),
            value: arg6.resolve_expression(),
            attributes,
            ref: createRef(this)
        })
    },
    Constant_withEmpty(arg0, _arg1, arg2, _arg3, arg4, _arg5) {
        const attributes = arg0.children.map((v) => v.resolve_const_attributes()) as ASTConstantAttribute[];
        checkConstAttributes(true, attributes, createRef(this));
        return createNode({
            kind: 'def_constant',
            name: arg2.sourceString,
            type: arg4.resolve_expression(),
            value: null,
            attributes,
            ref: createRef(this)
        })
    },
});

// Resolve attributes
semantics.addOperation<ASTFunctionAttribute>('resolve_attributes', {
    FunctionAttribute_getter(_arg0) {
        return { type: 'get', ref: createRef(this) };
    },
    FunctionAttribute_extends(_arg0) {
        return { type: 'extends', ref: createRef(this) };
    },
    FunctionAttribute_mutates(_arg0) {
        return { type: 'mutates', ref: createRef(this) };
    },
    FunctionAttribute_override(_arg0) {
        return { type: 'overrides', ref: createRef(this) };
    },
    FunctionAttribute_inline(_arg0) {
        return { type: 'inline', ref: createRef(this) };
    },
    FunctionAttribute_virtual(_arg0) {
        return { type: 'virtual', ref: createRef(this) };
    },
    FunctionAttribute_abstract(_arg0) {
        return { type: 'abstract', ref: createRef(this) };
    },
});

// Resolve const attributes
semantics.addOperation<ASTConstantAttribute>('resolve_const_attributes', {
    ConstantAttribute_override(_arg0) {
        return { type: 'overrides', ref: createRef(this) };
    },
    ConstantAttribute_virtual(_arg0) {
        return { type: 'virtual', ref: createRef(this) };
    },
    ConstantAttribute_abstract(_arg0) {
        return { type: 'abstract', ref: createRef(this) };
    },
});

// Resolve contract
semantics.addOperation<ASTContractAttribute>('resolve_contract_attributes', {
    ContractAttribute_interface(_arg0, _arg1, arg2, _arg3) {
        return { type: 'interface', name: arg2.resolve_expression(), ref: createRef(this) };
    }
});

// Struct and class declarations
semantics.addOperation<ASTNode>('resolve_declaration', {
    Field_default(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'def_field',
            name: arg0.sourceString,
            type: arg2.resolve_expression(),
            as: null,
            init: null,
            ref: createRef(this)
        })
    },
    Field_defaultWithInit(arg0, _arg1, arg2, _arg3, arg4, _arg5) {
        const tr = (arg2.resolve_expression() as ASTTypeRef);
        return createNode({
            kind: 'def_field',
            name: arg0.sourceString,
            type: tr,
            as: null,
            init: arg4.resolve_expression(),
            ref: createRef(this)
        })
    },
    Field_withSerialization(arg0, _arg1, arg2, _arg3, arg4, _arg5) {
        return createNode({
            kind: 'def_field',
            name: arg0.sourceString,
            type: arg2.resolve_expression(),
            as: arg4.sourceString,
            init: null,
            ref: createRef(this)
        })
    },
    Field_withSerializationAndInit(arg0, _arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7) {
        const tr = (arg2.resolve_expression() as ASTTypeRef);
        return createNode({
            kind: 'def_field',
            name: arg0.sourceString,
            type: tr,
            as: arg4.sourceString,
            init: arg6.resolve_expression(),
            ref: createRef(this)
        })
    },
    Constant_withValue(arg0, _arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7) {
        const attributes = arg0.children.map((v) => v.resolve_const_attributes()) as ASTConstantAttribute[];
        checkConstAttributes(false, attributes, createRef(this));
        return createNode({
            kind: 'def_constant',
            name: arg2.sourceString,
            type: arg4.resolve_expression(),
            value: arg6.resolve_expression(),
            attributes,
            ref: createRef(this)
        })
    },
    Constant_withEmpty(arg0, _arg1, arg2, _arg3, arg4, _) {
        const attributes = arg0.children.map((v) => v.resolve_const_attributes()) as ASTConstantAttribute[];
        checkConstAttributes(true, attributes, createRef(this));
        return createNode({
            kind: 'def_constant',
            name: arg2.sourceString,
            type: arg4.resolve_expression(),
            value: null,
            attributes,
            ref: createRef(this)
        })
    },
    FunctionArg(arg0, _arg1, arg2) {
        checkVariableName(arg0.sourceString, createRef(arg0));
        return createNode({
            kind: 'def_argument',
            name: arg0.sourceString,
            type: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    Function_withType(arg0, _arg1, arg2, _arg3, arg4, _arg5, _arg6, arg7, _arg8, arg9, _) {
        const attributes = arg0.children.map((v) => v.resolve_attributes()) as ASTFunctionAttribute[];
        checkVariableName(arg2.sourceString, createRef(arg2));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createNode({
            kind: 'def_function',
            origin: ctx!.origin,
            attributes,
            name: arg2.sourceString,
            return: arg7.resolve_expression(),
            args: arg4.asIteration().children.map((v) => v.resolve_declaration()),
            statements: arg9.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    Function_withVoid(arg0, _arg1, arg2, _arg3, arg4, _arg5, _arg6, arg7, _) {
        const attributes = arg0.children.map((v) => v.resolve_attributes()) as ASTFunctionAttribute[];
        checkVariableName(arg2.sourceString, createRef(arg2));
        checkFunctionAttributes(false, attributes, createRef(this));
        return createNode({
            kind: 'def_function',
            origin: ctx!.origin,
            attributes,
            name: arg2.sourceString,
            return: null,
            args: arg4.asIteration().children.map((v) => v.resolve_declaration()),
            statements: arg7.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    Function_abstractVoid(arg0, _arg1, arg2, _arg3, arg4, _arg5, _arg6) {
        const attributes = arg0.children.map((v) => v.resolve_attributes()) as ASTFunctionAttribute[];
        checkVariableName(arg2.sourceString, createRef(arg2));
        checkFunctionAttributes(true, attributes, createRef(this));
        return createNode({
            kind: 'def_function',
            origin: ctx!.origin,
            attributes,
            name: arg2.sourceString,
            return: null,
            args: arg4.asIteration().children.map((v) => v.resolve_declaration()),
            statements: null,
            ref: createRef(this)
        })
    },
    Function_abstractType(arg0, _arg1, arg2, _arg3, arg4, _arg5, _arg6, arg7, _arg8) {
        const attributes = arg0.children.map((v) => v.resolve_attributes()) as ASTFunctionAttribute[];
        checkVariableName(arg2.sourceString, createRef(arg2));
        checkFunctionAttributes(true, attributes, createRef(this));
        return createNode({
            kind: 'def_function',
            origin: ctx!.origin,
            attributes,
            name: arg2.sourceString,
            return: arg7.resolve_expression(),
            args: arg4.asIteration().children.map((v) => v.resolve_declaration()),
            statements: null,
            ref: createRef(this)
        })
    },
    NativeFunction_withType(_arg0, _arg1, arg2, _arg3, arg4, arg5, arg6, _arg7, arg8, _arg9, _arg10, arg11, _arg12) {
        checkVariableName(arg5.sourceString, createRef(arg5));
        return createNode({
            kind: 'def_native_function',
            origin: ctx!.origin,
            attributes: arg4.children.map((v) => v.resolve_attributes()),
            name: arg6.sourceString,
            nativeName: arg2.sourceString,
            return: arg11.resolve_expression(),
            args: arg8.asIteration().children.map((v) => v.resolve_declaration()),
            ref: createRef(this)
        })
    },
    NativeFunction_withVoid(_arg0, _arg1, arg2, _arg3, arg4, arg5, arg6, _arg7, arg8, _arg9, _arg10) {
        checkVariableName(arg5.sourceString, createRef(arg5));
        return createNode({
            kind: 'def_native_function',
            origin: ctx!.origin,
            attributes: arg4.children.map((v) => v.resolve_attributes()),
            name: arg6.sourceString,
            nativeName: arg2.sourceString,
            return: null,
            args: arg8.asIteration().children.map((v) => v.resolve_declaration()),
            ref: createRef(this)
        })
    },
    ContractInit(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'def_init_function',
            args: arg2.asIteration().children.map((v) => v.resolve_declaration()),
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    ReceiveFunction_simple(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'def_receive',
            selector: { kind: 'internal-simple', arg: arg2.resolve_declaration() },
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    ReceiveFunction_empty(_arg0, _arg1, _arg2, _arg3, arg4, _arg5) {
        return createNode({
            kind: 'def_receive',
            selector: { kind: 'internal-fallback' },
            statements: arg4.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    ReceiveFunction_comment(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'def_receive',
            selector: { kind: 'internal-comment', comment: arg2.resolve_expression() },
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    ReceiveFunction_bounced(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'def_receive',
            selector: { kind: 'bounce', arg: arg2.resolve_declaration() },
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    ReceiveFunction_externalSimple(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'def_receive',
            selector: { kind: 'external-simple', arg: arg2.resolve_declaration() },
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    ReceiveFunction_externalComment(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'def_receive',
            selector: { kind: 'external-comment', comment: arg2.resolve_expression() },
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
});

// Statements
semantics.addOperation<ASTNode>('resolve_statement', {
    StatementLet(_arg0, arg1, _arg2, arg3, _arg4, arg5, _arg6) {
        checkVariableName(arg1.sourceString, createRef(arg1));

        return createNode({
            kind: 'statement_let',
            name: arg1.sourceString,
            type: arg3.resolve_expression(),
            expression: arg5.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementReturn_withExpression(_arg0, arg1, _arg2) {
        return createNode({
            kind: 'statement_return',
            expression: arg1.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementReturn_withoutExpression(_arg0, _arg1) {
        return createNode({
            kind: 'statement_return',
            expression: null,
            ref: createRef(this)
        })
    },
    StatementExpression(arg0, _arg1) {
        return createNode({
            kind: 'statement_expression',
            expression: arg0.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAssign(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'statement_assign',
            path: arg0.resolve_lvalue(),
            expression: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAugmentedAssignAdd(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'statement_augmentedassign',
            path: arg0.resolve_lvalue(),
            op: '+',
            expression: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAugmentedAssignSub(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'statement_augmentedassign',
            path: arg0.resolve_lvalue(),
            op: '-',
            expression: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAugmentedAssignMul(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'statement_augmentedassign',
            path: arg0.resolve_lvalue(),
            op: '*',
            expression: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAugmentedAssignDiv(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'statement_augmentedassign',
            path: arg0.resolve_lvalue(),
            op: '/',
            expression: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementAugmentedAssignRem(arg0, _arg1, arg2, _arg3) {
        return createNode({
            kind: 'statement_augmentedassign',
            path: arg0.resolve_lvalue(),
            op: '%',
            expression: arg2.resolve_expression(),
            ref: createRef(this)
        })
    },
    StatementCondition_simple(_arg0, arg1, _arg2, arg3, _arg4) {
        return createNode({
            kind: 'statement_condition',
            expression: arg1.resolve_expression(),
            trueStatements: arg3.children.map((v) => v.resolve_statement()),
            falseStatements: null,
            elseif: null,
            ref: createRef(this)
        })
    },
    StatementCondition_withElse(_arg0, arg1, _arg2, arg3, _arg4, _arg5, _arg6, arg7, _arg8) {
        return createNode({
            kind: 'statement_condition',
            expression: arg1.resolve_expression(),
            trueStatements: arg3.children.map((v) => v.resolve_statement()),
            falseStatements: arg7.children.map((v) => v.resolve_statement()),
            elseif: null,
            ref: createRef(this)
        })
    },
    StatementCondition_withElseIf(_arg0, arg1, _arg2, arg3, _arg4, _arg5, arg6) {
        return createNode({
            kind: 'statement_condition',
            expression: arg1.resolve_expression(),
            trueStatements: arg3.children.map((v) => v.resolve_statement()),
            falseStatements: null,
            elseif: arg6.resolve_statement(),
            ref: createRef(this)
        })
    },
    StatementWhile(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'statement_while',
            condition: arg2.resolve_expression(),
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    StatementRepeat(_arg0, _arg1, arg2, _arg3, _arg4, arg5, _arg6) {
        return createNode({
            kind: 'statement_repeat',
            condition: arg2.resolve_expression(),
            statements: arg5.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
    StatementUntil(_arg0, _arg1, arg2, _arg3, _arg4, _arg5, arg6, _arg7, _arg8) {
        return createNode({
            kind: 'statement_until',
            condition: arg6.resolve_expression(),
            statements: arg2.children.map((v) => v.resolve_statement()),
            ref: createRef(this)
        })
    },
});

// LValue
semantics.addOperation<ASTNode[]>('resolve_lvalue', {
    LValue_single(arg0) {
        return [createNode({
            kind: 'lvalue_ref',
            name: arg0.sourceString,
            ref: createRef(this)
        })];
    },
    LValue_more(arg0, arg1, arg2) {
        return [createNode({
            kind: 'lvalue_ref',
            name: arg0.sourceString,
            ref: createRef(arg0, arg1)
        }), ...arg2.resolve_lvalue()];
    }
});

// Expressions
semantics.addOperation<ASTNode>('resolve_expression', {

    // Literals
    integerLiteral(n) {
        return createNode({ kind: 'number', value: BigInt(n.sourceString.replaceAll('_', '')), ref: createRef(this) }); // Parses dec, hex, and bin numbers
    },
    boolLiteral(arg0) {
        return createNode({ kind: 'boolean', value: arg0.sourceString === 'true', ref: createRef(this) });
    },
    id(arg0, arg1) {
        return createNode({ kind: 'id', value: arg0.sourceString + arg1.sourceString, ref: createRef(this) });
    },
    funcId(arg0, arg1) {
        return createNode({ kind: 'id', value: arg0.sourceString + arg1.sourceString, ref: createRef(this) });
    },
    null(_arg0) {
        return createNode({ kind: 'null', ref: createRef(this) });
    },
    stringLiteral(_arg0, arg1, _arg2) {
        return createNode({ kind: 'string', value: arg1.sourceString, ref: createRef(this) });
    },

    // TypeRefs
    Type_optional(arg0, _arg1) {
        return createNode({ kind: 'type_ref_simple', name: arg0.sourceString, optional: true, ref: createRef(this) });
    },
    Type_required(arg0) {
        return createNode({ kind: 'type_ref_simple', name: arg0.sourceString, optional: false, ref: createRef(this) });
    },
    Type_map(_arg0, _arg1, arg2, _arg3, arg4, _arg5, arg6, _arg7, arg8, _arg9) {

        return createNode({
            kind: 'type_ref_map',
            key: arg2.sourceString,
            keyAs: arg4.numChildren === 1 ? arg4.children[0].sourceString : null,
            value: arg6.sourceString,
            valueAs: arg8.numChildren === 1 ? arg8.children[0].sourceString : null,
            ref: createRef(this)
        });
    },
    Type_bounced(_arg0, _arg1, arg2, _arg3) {
        return createNode({ kind: 'type_ref_bounced', name: arg2.sourceString, ref: createRef(this) });
    },

    // Binary
    ExpressionAdd_add(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '+', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionAdd_sub(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '-', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionMul_div(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '/', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionMul_mul(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '*', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionMul_rem(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '%', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_eq(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '==', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_not(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '!=', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_gt(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_gte(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>=', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_lt(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '<', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionCompare_lte(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '<=', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionOr_or(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '||', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionAnd_and(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '&&', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionBinary_shr(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '>>', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionBinary_shl(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '<<', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionBinary_bin_and(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '&', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionBinary_bin_or(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_binary', op: '|', left: arg0.resolve_expression(), right: arg2.resolve_expression(), ref: createRef(this) });
    },

    // Unary
    ExpressionUnary_add(_arg0, arg1) {
        return createNode({ kind: 'op_unary', op: '+', right: arg1.resolve_expression(), ref: createRef(this) });
    },
    ExpressionUnary_neg(_arg0, arg1) {
        return createNode({ kind: 'op_unary', op: '-', right: arg1.resolve_expression(), ref: createRef(this) });
    },
    ExpressionUnary_not(_arg0, arg1) {
        return createNode({ kind: 'op_unary', op: '!', right: arg1.resolve_expression(), ref: createRef(this) });
    },
    ExpressionBracket(_arg0, arg1, _arg2) {
        return arg1.resolve_expression();
    },
    ExpressionUnarySuffix_notNull(arg0, _arg1) {
        return createNode({ kind: 'op_unary', op: '!!', right: arg0.resolve_expression(), ref: createRef(this) });
    },

    // Access
    ExpressionField(arg0, _arg1, arg2) {
        return createNode({ kind: 'op_field', src: arg0.resolve_expression(), name: arg2.sourceString, ref: createRef(this) });
    },
    ExpressionCall(arg0, _arg1, arg2, _arg3, arg4, _arg5) {
        return createNode({ kind: 'op_call', src: arg0.resolve_expression(), name: arg2.sourceString, args: arg4.asIteration().children.map((v) => v.resolve_expression()), ref: createRef(this) });
    },
    ExpressionStaticCall(arg0, _arg1, arg2, _arg3) {
        return createNode({ kind: 'op_static_call', name: arg0.sourceString, args: arg2.asIteration().children.map((v) => v.resolve_expression()), ref: createRef(this) });
    },
    ExpressionNew(arg0, _arg1, arg2, _arg3) {
        return createNode({ kind: 'op_new', type: arg0.sourceString, args: arg2.asIteration().children.map((v) => v.resolve_expression()), ref: createRef(this) });
    },
    NewParameter(arg0, _arg1, arg2) {
        return createNode({ kind: 'new_parameter', name: arg0.sourceString, exp: arg2.resolve_expression(), ref: createRef(this) });
    },
    ExpressionInitOf(_arg0, arg1, _arg2, arg3, _arg4) {
        return createNode({ kind: 'init_of', name: arg1.sourceString, args: arg3.asIteration().children.map((v) => v.resolve_expression()), ref: createRef(this) });
    },

    // Ternary conditional
    ExpressionConditional_ternary(arg0, _arg1, arg2, _arg3, arg4) {
        return createNode({ kind: 'conditional', condition: arg0.resolve_expression(), thenBranch: arg2.resolve_expression(), elseBranch: arg4.resolve_expression(), ref: createRef(this) });
    },
});

function throwMatchError(matchResult: MatchResult, path: string): never {
    const interval = matchResult.getInterval();
    const lc = interval.getLineAndColumn() as { lineNum: number, colNum: number };
    const msg = interval.getLineAndColumnMessage();
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const message = path + ':' + lc.lineNum + ':' + lc.colNum + ': Syntax error: expected ' + (matchResult as any).getExpectedText() + ' \n' + msg;
    throw new TactSyntaxError(message, new ASTRef(interval, path));
}

export function parse(src: string, path: string, origin: TypeOrigin): ASTProgram {
    return inFile(path, () => {
        const matchResult = rawGrammar.match(src);
        if (matchResult.failed()) {
            throwMatchError(matchResult, path);
        }
        ctx = { origin };
        try {
            return semantics(matchResult).resolve_program();
        } finally {
            ctx = null;
        }
    });
}

export function parseImports(src: string, path: string, origin: TypeOrigin): string[] {
    const r = parse(src, path, origin);
    const imports: string[] = [];
    let hasExpression = false;
    for (const e of r.entries) {
        if (e.kind === 'program_import') {
            if (hasExpression) {
                throwError('Import must be at the top of the file', e.ref);
            }
            imports.push(e.path.value);
        } else {
            hasExpression = true;
        }
    }
    return imports;
}