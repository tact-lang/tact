import {
    AstConstantDef,
    AstReceiverKind,
    AstStructFieldInitializer,
    AstFunctionAttribute,
    AstOpBinary,
    AstOpUnary,
    AstFieldAccess,
    AstConditional,
    AstMethodCall,
    AstStaticCall,
    AstNumber,
    AstBoolean,
    AstString,
    AstStructInstance,
    AstInitOf,
    AstConstantAttribute,
    AstContractAttribute,
    AstTypedParameter,
    AstImport,
    AstNativeFunctionDecl,
    AstReceiver,
    AstStatementRepeat,
    AstStatementUntil,
    AstStatementWhile,
    AstStatementForEach,
    AstStatementTry,
    AstStatementTryCatch,
    AstCondition,
    AstStatementAugmentedAssign,
    AstStatementAssign,
    AstStatementExpression,
    AstStatementReturn,
    AstStatementLet,
    AstFunctionDef,
    AstContract,
    AstTrait,
    AstId,
    AstModule,
    AstStructDecl,
    AstMessageDecl,
    AstFunctionDecl,
    AstConstantDecl,
    AstContractInit,
    AstPrimitiveTypeDecl,
    AstTypeId,
    AstMapType,
    AstBouncedMessageType,
    AstFieldDecl,
    AstOptionalType,
    AstNode,
    AstFuncId,
    AstAsmFunctionDef,
    AstAsmInstruction,
} from "./ast";
import { AstRenamer } from "./rename";
import { throwInternalCompilerError } from "../errors";
import JSONbig from "json-bigint";

/**
 * Provides an API to compare two AST nodes with extra options.
 */
export class AstComparator {
    /**
     * @param sort Topologically sort AST entries before comparing. Should be enabled
     *        in order to handle duplicate entries shuffled in the source code.
     * @param canonicalize Introduce de Brujin indices for local bindings to handle
     *        duplicate code with different names. Should be enabled in order to
     *        treat duplicate entries with different names as the same elements.
     */
    private constructor(
        private readonly sort: boolean,
        private readonly canonicalize: boolean,
    ) {}

    public static make(
        options: Partial<{ sort: boolean; canonicalize: boolean }> = {},
    ): AstComparator {
        const { sort = true, canonicalize = true } = options;
        return new AstComparator(sort, canonicalize);
    }

    public compare(node1: AstNode, node2: AstNode): boolean {
        if (node1.kind !== node2.kind) {
            return false;
        }

        switch (node1.kind) {
            case "module": {
                if (this.canonicalize) {
                    const renamer = AstRenamer.make({ sort: this.sort });
                    node1 = renamer.renameModule(node1 as AstModule);
                    node2 = renamer.renameModule(node2 as AstModule);
                }
                const { imports: imports1, items: items1 } = node1 as AstModule;
                const { imports: imports2, items: items2 } = node2 as AstModule;
                return (
                    this.compareArray(imports1, imports2) &&
                    this.compareArray(items1, items2)
                );
            }

            case "import": {
                const { path: path1 } = node1 as AstImport;
                const { path: path2 } = node2 as AstImport;
                return this.compare(path1, path2);
            }

            case "primitive_type_decl": {
                const { name: name1 } = node1 as AstPrimitiveTypeDecl;
                const { name: name2 } = node2 as AstPrimitiveTypeDecl;
                return this.compare(name1, name2);
            }

            case "function_def": {
                const {
                    attributes: attributes1,
                    name: funcName1,
                    return: returnType1,
                    params: params1,
                    statements: statements1,
                } = node1 as AstFunctionDef;
                const {
                    attributes: attributes2,
                    name: funcName2,
                    return: returnType2,
                    params: params2,
                    statements: statements2,
                } = node2 as AstFunctionDef;
                return (
                    this.compareAttributes(attributes1, attributes2) &&
                    this.compare(funcName1, funcName2) &&
                    this.compareNullableNodes(returnType1, returnType2) &&
                    this.compareArray(params1, params2) &&
                    this.compareArray(statements1, statements2)
                );
            }

            case "asm_function_def": {
                const {
                    shuffle: shuffle1,
                    attributes: attributes1,
                    name: funcName1,
                    return: returnType1,
                    params: params1,
                    instructions: instructions1,
                } = node1 as AstAsmFunctionDef;
                const {
                    shuffle: shuffle2,
                    attributes: attributes2,
                    name: funcName2,
                    return: returnType2,
                    params: params2,
                    instructions: instructions2,
                } = node2 as AstAsmFunctionDef;
                return (
                    this.compareArray(shuffle1.args, shuffle2.args) &&
                    this.compareArray(shuffle1.ret, shuffle2.ret) &&
                    this.compareAttributes(attributes1, attributes2) &&
                    this.compare(funcName1, funcName2) &&
                    this.compareNullableNodes(returnType1, returnType2) &&
                    this.compareArray(params1, params2) &&
                    this.compareAsmInstructions(instructions1, instructions2)
                );
            }
            case "function_decl": {
                const {
                    attributes: declAttributes1,
                    name: declName1,
                    return: declReturnType1,
                    params: declParams1,
                } = node1 as AstFunctionDecl;
                const {
                    attributes: declAttributes2,
                    name: declName2,
                    return: declReturnType2,
                    params: declParams2,
                } = node2 as AstFunctionDecl;
                return (
                    this.compareAttributes(declAttributes1, declAttributes2) &&
                    this.compare(declName1, declName2) &&
                    this.compareNullableNodes(
                        declReturnType1,
                        declReturnType2,
                    ) &&
                    this.compareArray(declParams1, declParams2)
                );
            }

            case "native_function_decl": {
                const {
                    attributes: nativeAttributes1,
                    name: nativeName1,
                    nativeName: nativeFuncName1,
                    params: nativeParams1,
                    return: returnTy1,
                } = node1 as AstNativeFunctionDecl;
                const {
                    attributes: nativeAttributes2,
                    name: nativeName2,
                    nativeName: nativeFuncName2,
                    params: nativeParams2,
                    return: returnTy2,
                } = node2 as AstNativeFunctionDecl;
                return (
                    this.compareAttributes(
                        nativeAttributes1,
                        nativeAttributes2,
                    ) &&
                    this.compare(nativeName1, nativeName2) &&
                    this.compare(nativeFuncName1, nativeFuncName2) &&
                    this.compareNullableNodes(returnTy1, returnTy2) &&
                    this.compareArray(nativeParams1, nativeParams2)
                );
            }

            case "constant_def": {
                const {
                    attributes: constAttributes1,
                    name: constName1,
                    type: constType1,
                    initializer: constInitializer1,
                } = node1 as AstConstantDef;
                const {
                    attributes: constAttributes2,
                    name: constName2,
                    type: constType2,
                    initializer: constInitializer2,
                } = node2 as AstConstantDef;
                return (
                    this.compareAttributes(
                        constAttributes1,
                        constAttributes2,
                    ) &&
                    this.compare(constName1, constName2) &&
                    this.compare(constType1, constType2) &&
                    this.compare(constInitializer1, constInitializer2)
                );
            }

            case "constant_decl": {
                const {
                    attributes: constDeclAttributes1,
                    name: constDeclName1,
                    type: constDeclType1,
                } = node1 as AstConstantDecl;
                const {
                    attributes: constDeclAttributes2,
                    name: constDeclName2,
                    type: constDeclType2,
                } = node2 as AstConstantDecl;
                return (
                    this.compareAttributes(
                        constDeclAttributes1,
                        constDeclAttributes2,
                    ) &&
                    this.compare(constDeclName1, constDeclName2) &&
                    this.compare(constDeclType1, constDeclType2)
                );
            }

            case "struct_decl": {
                const { name: structName1, fields: structFields1 } =
                    node1 as AstStructDecl;
                const { name: structName2, fields: structFields2 } =
                    node2 as AstStructDecl;
                return (
                    this.compare(structName1, structName2) &&
                    this.compareArray(structFields1, structFields2)
                );
            }

            case "message_decl": {
                const { name: msgName1, fields: msgFields1 } =
                    node1 as AstMessageDecl;
                const { name: msgName2, fields: msgFields2 } =
                    node2 as AstMessageDecl;
                return (
                    this.compare(msgName1, msgName2) &&
                    this.compareArray(msgFields1, msgFields2)
                );
            }

            case "contract": {
                const {
                    name: contractName1,
                    traits: contractTraits1,
                    attributes: contractAttributes1,
                    declarations: contractDeclarations1,
                } = node1 as AstContract;
                const {
                    name: contractName2,
                    traits: contractTraits2,
                    attributes: contractAttributes2,
                    declarations: contractDeclarations2,
                } = node2 as AstContract;
                return (
                    this.compare(contractName1, contractName2) &&
                    this.compareArray(contractTraits1, contractTraits2) &&
                    this.compareAttributes(
                        contractAttributes1,
                        contractAttributes2,
                    ) &&
                    this.compareArray(
                        contractDeclarations1,
                        contractDeclarations2,
                    )
                );
            }

            case "trait": {
                const {
                    name: traitName1,
                    traits: traits1,
                    attributes: attributes1,
                    declarations: declarations1,
                } = node1 as AstTrait;
                const {
                    name: traitName2,
                    traits: traits2,
                    attributes: attributes2,
                    declarations: declarations2,
                } = node2 as AstTrait;
                return (
                    this.compare(traitName1, traitName2) &&
                    this.compareArray(traits1, traits2) &&
                    this.compareAttributes(attributes1, attributes2) &&
                    this.compareArray(declarations1, declarations2)
                );
            }

            case "field_decl": {
                const {
                    name: fieldName1,
                    type: fieldType1,
                    initializer: fieldInitializer1,
                    as: as1,
                } = node1 as AstFieldDecl;
                const {
                    name: fieldName2,
                    type: fieldType2,
                    initializer: fieldInitializer2,
                    as: as2,
                } = node2 as AstFieldDecl;
                return (
                    this.compare(fieldName1, fieldName2) &&
                    this.compare(fieldType1, fieldType2) &&
                    this.compareNullableNodes(
                        fieldInitializer1,
                        fieldInitializer2,
                    ) &&
                    this.compareNullableNodes(as1, as2)
                );
            }

            case "receiver": {
                const {
                    selector: receiverSelector1,
                    statements: receiverStatements1,
                } = node1 as AstReceiver;
                const {
                    selector: receiverSelector2,
                    statements: receiverStatements2,
                } = node2 as AstReceiver;
                return (
                    this.compareReceiverKinds(
                        receiverSelector1,
                        receiverSelector2,
                    ) &&
                    this.compareArray(receiverStatements1, receiverStatements2)
                );
            }

            case "contract_init": {
                const { params: initParams1, statements: initStatements1 } =
                    node1 as AstContractInit;
                const { params: initParams2, statements: initStatements2 } =
                    node2 as AstContractInit;
                return (
                    this.compareArray(initParams1, initParams2) &&
                    this.compareArray(initStatements1, initStatements2)
                );
            }

            case "statement_let": {
                const {
                    name: name1,
                    type: ty1,
                    expression: expr1,
                } = node1 as AstStatementLet;
                const {
                    name: name2,
                    type: ty2,
                    expression: expr2,
                } = node2 as AstStatementLet;
                return (
                    this.compare(name1, name2) &&
                    this.compareNullableNodes(ty1, ty2) &&
                    this.compare(expr1, expr2)
                );
            }

            case "statement_return": {
                const { expression: expr1 } = node1 as AstStatementReturn;
                const { expression: expr2 } = node2 as AstStatementReturn;
                return this.compareNullableNodes(expr1, expr2);
            }

            case "statement_expression": {
                const { expression: expr1 } = node1 as AstStatementExpression;
                const { expression: expr2 } = node2 as AstStatementExpression;
                return this.compareNullableNodes(expr1, expr2);
            }

            case "statement_assign": {
                const { path: assignPath1, expression: assignExpression1 } =
                    node1 as AstStatementAssign;
                const { path: assignPath2, expression: assignExpression2 } =
                    node2 as AstStatementAssign;
                return (
                    this.compare(assignPath1, assignPath2) &&
                    this.compare(assignExpression1, assignExpression2)
                );
            }

            case "statement_augmentedassign": {
                const {
                    op: augOp1,
                    path: augPath1,
                    expression: augExpression1,
                } = node1 as AstStatementAugmentedAssign;
                const {
                    op: augOp2,
                    path: augPath2,
                    expression: augExpression2,
                } = node2 as AstStatementAugmentedAssign;
                return (
                    augOp1 === augOp2 &&
                    this.compare(augPath1, augPath2) &&
                    this.compare(augExpression1, augExpression2)
                );
            }

            case "statement_condition": {
                const {
                    condition: cond1,
                    trueStatements: true1,
                    falseStatements: false1,
                    elseif: condElseIf1,
                } = node1 as AstCondition;
                const {
                    condition: cond2,
                    trueStatements: true2,
                    falseStatements: false2,
                    elseif: condElseIf2,
                } = node2 as AstCondition;
                return (
                    this.compare(cond1, cond2) &&
                    this.compareArray(true1, true2) &&
                    this.compareNullableArray(false1, false2) &&
                    this.compareNullableNodes(condElseIf1, condElseIf2)
                );
            }

            case "statement_while": {
                const {
                    condition: loopCondition1,
                    statements: loopStatements1,
                } = node1 as AstStatementWhile;
                const {
                    condition: loopCondition2,
                    statements: loopStatements2,
                } = node2 as AstStatementWhile;
                return (
                    this.compare(loopCondition1, loopCondition2) &&
                    this.compareArray(loopStatements1, loopStatements2)
                );
            }

            case "statement_until": {
                const {
                    condition: loopCondition1,
                    statements: loopStatements1,
                } = node1 as AstStatementUntil;
                const {
                    condition: loopCondition2,
                    statements: loopStatements2,
                } = node2 as AstStatementUntil;
                return (
                    this.compare(loopCondition1, loopCondition2) &&
                    this.compareArray(loopStatements1, loopStatements2)
                );
            }

            case "statement_repeat": {
                const { iterations: iter1, statements: stmts1 } =
                    node1 as AstStatementRepeat;
                const { iterations: iter2, statements: stmts2 } =
                    node2 as AstStatementRepeat;
                return (
                    this.compare(iter1, iter2) &&
                    this.compareArray(stmts1, stmts2)
                );
            }

            case "statement_try": {
                const { statements: tryStatements1 } = node1 as AstStatementTry;
                const { statements: tryStatements2 } = node2 as AstStatementTry;
                return this.compareArray(tryStatements1, tryStatements2);
            }

            case "statement_try_catch": {
                const {
                    statements: tryCatchStatements1,
                    catchName: catchName1,
                    catchStatements: catchStatements1,
                } = node1 as AstStatementTryCatch;
                const {
                    statements: tryCatchStatements2,
                    catchName: catchName2,
                    catchStatements: catchStatements2,
                } = node2 as AstStatementTryCatch;
                return (
                    this.compareArray(
                        tryCatchStatements1,
                        tryCatchStatements2,
                    ) &&
                    this.compare(catchName1, catchName2) &&
                    this.compareArray(catchStatements1, catchStatements2)
                );
            }

            case "statement_foreach": {
                const {
                    keyName: forEachKeyName1,
                    valueName: forEachValueName1,
                    map: forEachMap1,
                    statements: forEachStatements1,
                } = node1 as AstStatementForEach;
                const {
                    keyName: forEachKeyName2,
                    valueName: forEachValueName2,
                    map: forEachMap2,
                    statements: forEachStatements2,
                } = node2 as AstStatementForEach;
                return (
                    this.compare(forEachKeyName1, forEachKeyName2) &&
                    this.compare(forEachValueName1, forEachValueName2) &&
                    this.compare(forEachMap1, forEachMap2) &&
                    this.compareArray(forEachStatements1, forEachStatements2)
                );
            }

            case "type_id": {
                const { text: typeIdText1 } = node1 as AstTypeId;
                const { text: typeIdText2 } = node2 as AstTypeId;
                return typeIdText1 === typeIdText2;
            }

            case "optional_type": {
                const { typeArg: optionalTypeArg1 } = node1 as AstOptionalType;
                const { typeArg: optionalTypeArg2 } = node2 as AstOptionalType;
                return this.compare(optionalTypeArg1, optionalTypeArg2);
            }

            case "map_type": {
                const {
                    keyType: mapKeyType1,
                    keyStorageType: mapKeyStorageType1,
                    valueType: mapValueType1,
                    valueStorageType: mapValueStorageType1,
                } = node1 as AstMapType;
                const {
                    keyType: mapKeyType2,
                    keyStorageType: mapKeyStorageType2,
                    valueType: mapValueType2,
                    valueStorageType: mapValueStorageType2,
                } = node2 as AstMapType;
                return (
                    this.compare(mapKeyType1, mapKeyType2) &&
                    this.compareNullableNodes(
                        mapKeyStorageType1,
                        mapKeyStorageType2,
                    ) &&
                    this.compare(mapValueType1, mapValueType2) &&
                    this.compareNullableNodes(
                        mapValueStorageType1,
                        mapValueStorageType2,
                    )
                );
            }

            case "bounced_message_type": {
                const { messageType: messageTy1 } =
                    node1 as AstBouncedMessageType;
                const { messageType: messageTy2 } =
                    node2 as AstBouncedMessageType;
                return this.compare(messageTy1, messageTy2);
            }

            case "op_binary": {
                const {
                    op: binaryOp1,
                    left: lhs1,
                    right: rhs1,
                } = node1 as AstOpBinary;
                const {
                    op: binaryOp2,
                    left: lhs2,
                    right: rhs2,
                } = node2 as AstOpBinary;
                return (
                    binaryOp1 === binaryOp2 &&
                    this.compare(lhs1, lhs2) &&
                    this.compare(rhs1, rhs2)
                );
            }

            case "op_unary": {
                const { op: op1, operand: operand1 } = node1 as AstOpUnary;
                const { op: op2, operand: operand2 } = node2 as AstOpUnary;
                return op1 === op2 && this.compare(operand1, operand2);
            }

            case "field_access": {
                const { aggregate: aggregate1, field: field1 } =
                    node1 as AstFieldAccess;
                const { aggregate: aggregate2, field: field2 } =
                    node2 as AstFieldAccess;
                return (
                    this.compare(aggregate1, aggregate2) &&
                    this.compare(field1, field2)
                );
            }

            case "method_call": {
                const {
                    self: self1,
                    method: method1,
                    args: args1,
                } = node1 as AstMethodCall;
                const {
                    self: self2,
                    method: method2,
                    args: args2,
                } = node2 as AstMethodCall;
                return (
                    this.compare(self1, self2) &&
                    this.compare(method1, method2) &&
                    this.compareArray(args1, args2)
                );
            }

            case "static_call": {
                const { function: staticFunction1, args: staticArgs1 } =
                    node1 as AstStaticCall;
                const { function: staticFunction2, args: staticArgs2 } =
                    node2 as AstStaticCall;
                return (
                    this.compare(staticFunction1, staticFunction2) &&
                    this.compareArray(staticArgs1, staticArgs2)
                );
            }

            case "struct_instance": {
                const { type: ty1, args: args1 } = node1 as AstStructInstance;
                const { type: ty2, args: args2 } = node2 as AstStructInstance;
                return (
                    this.compare(ty1, ty2) && this.compareArray(args1, args2)
                );
            }

            case "init_of": {
                const { contract: initOfContract1, args: initOfArgs1 } =
                    node1 as AstInitOf;
                const { contract: initOfContract2, args: initOfArgs2 } =
                    node2 as AstInitOf;
                return (
                    this.compare(initOfContract1, initOfContract2) &&
                    this.compareArray(initOfArgs1, initOfArgs2)
                );
            }

            case "conditional": {
                const {
                    condition: cond1,
                    thenBranch: then1,
                    elseBranch: else1,
                } = node1 as AstConditional;
                const {
                    condition: cond2,
                    thenBranch: then2,
                    elseBranch: else2,
                } = node2 as AstConditional;
                return (
                    this.compare(cond1, cond2) &&
                    this.compare(then1, then2) &&
                    this.compare(else1, else2)
                );
            }

            case "id": {
                const { text: text1 } = node1 as AstId;
                const { text: text2 } = node2 as AstId;
                return text1 === text2;
            }

            case "func_id": {
                const { text: text1 } = node1 as AstFuncId;
                const { text: text2 } = node2 as AstFuncId;
                return text1 === text2;
            }

            case "number": {
                const { value: val1 } = node1 as AstNumber;
                const { value: val2 } = node2 as AstNumber;
                return val1 === val2;
            }

            case "boolean": {
                const { value: val1 } = node1 as AstBoolean;
                const { value: val2 } = node2 as AstBoolean;
                return val1 === val2;
            }

            case "string": {
                const { value: val1 } = node1 as AstString;
                const { value: val2 } = node2 as AstString;
                return val1 === val2;
            }

            case "null": {
                return true;
            }

            case "typed_parameter": {
                const { name: name1, type: ty1 } = node1 as AstTypedParameter;
                const { name: name2, type: ty2 } = node1 as AstTypedParameter;
                return this.compare(name1, name2) && this.compare(ty1, ty2);
            }

            case "struct_field_initializer": {
                const { field: field1, initializer: initializer1 } =
                    node1 as AstStructFieldInitializer;
                const { field: field2, initializer: initializer2 } =
                    node2 as AstStructFieldInitializer;
                return (
                    this.compare(field1, field2) &&
                    this.compare(initializer1, initializer2)
                );
            }

            default:
                throwInternalCompilerError(
                    `Unsupported node: ${JSONbig.stringify(node1)}`,
                );
        }
    }

    private compareNullableNodes(
        node1: AstNode | null,
        node2: AstNode | null,
    ): boolean {
        if (node1 === null || node2 === null) {
            return node1 === node2;
        }
        return this.compare(node1, node2);
    }

    private compareArray(nodes1: AstNode[], nodes2: AstNode[]): boolean {
        if (nodes1.length !== nodes2.length) {
            return false;
        }
        for (let i = 0; i < nodes1.length; i++) {
            if (!this.compare(nodes1[i]!, nodes2[i]!)) {
                return false;
            }
        }
        return true;
    }

    private compareNullableArray(
        nodes1: AstNode[] | null,
        nodes2: AstNode[] | null,
    ): boolean {
        if (nodes1 === null || nodes2 === null) {
            return nodes1 === nodes2;
        }
        return this.compareArray(nodes1, nodes2);
    }

    private compareAsmInstructions(
        instructions1: AstAsmInstruction[],
        instructions2: AstAsmInstruction[],
    ): boolean {
        if (instructions1.length !== instructions2.length) {
            return false;
        }
        return instructions1.every((val1, i1) => val1 === instructions2[i1]);
    }

    private compareAttributes<
        T extends
            | AstFunctionAttribute
            | AstConstantAttribute
            | AstContractAttribute,
    >(attrs1: T[], attrs2: T[]): boolean {
        if (attrs1.length !== attrs2.length) {
            return false;
        }
        for (let i = 0; i < attrs1.length; i++) {
            if (attrs1[i]!.type !== attrs2[i]!.type) {
                return false;
            }
        }
        return true;
    }

    private compareReceiverKinds(
        kind1: AstReceiverKind,
        kind2: AstReceiverKind,
    ): boolean {
        if (kind1.kind !== kind2.kind) {
            return false;
        }
        if (
            (kind1.kind === "internal-simple" &&
                kind2.kind === "internal-simple") ||
            (kind1.kind === "bounce" && kind2.kind === "bounce") ||
            (kind1.kind === "external-simple" &&
                kind2.kind === "external-simple")
        ) {
            return this.compare(kind1.param, kind2.param);
        }
        if (
            (kind1.kind === "internal-comment" &&
                kind2.kind === "internal-comment") ||
            (kind1.kind === "external-comment" &&
                kind2.kind === "external-comment")
        ) {
            return this.compare(kind1.comment, kind2.comment);
        }
        return true;
    }
}
