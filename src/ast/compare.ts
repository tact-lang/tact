import * as A from "./ast";
import { AstRenamer } from "./rename";
import { throwInternalCompilerError } from "../error/errors";
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

    public compare(node1: A.AstNode, node2: A.AstNode): boolean {
        if (node1.kind !== node2.kind) {
            return false;
        }

        switch (node1.kind) {
            case "module": {
                if (this.canonicalize) {
                    const renamer = AstRenamer.make({ sort: this.sort });
                    node1 = renamer.renameModule(node1 as A.AstModule);
                    node2 = renamer.renameModule(node2 as A.AstModule);
                }
                const { imports: imports1, items: items1 } =
                    node1 as A.AstModule;
                const { imports: imports2, items: items2 } =
                    node2 as A.AstModule;
                return (
                    this.compareArray(imports1, imports2) &&
                    this.compareArray(items1, items2)
                );
            }

            case "import": {
                const { importPath: source1 } = node1 as A.AstImport;
                const { importPath: source2 } = node2 as A.AstImport;
                return (
                    source1.language === source2.language &&
                    source1.type === source2.type &&
                    source1.path.stepsUp === source2.path.stepsUp &&
                    source1.path.segments.join("/") ===
                        source2.path.segments.join("/")
                );
            }

            case "primitive_type_decl": {
                const { name: name1 } = node1 as A.AstPrimitiveTypeDecl;
                const { name: name2 } = node2 as A.AstPrimitiveTypeDecl;
                return this.compare(name1, name2);
            }

            case "function_def": {
                const {
                    attributes: attributes1,
                    name: funcName1,
                    return: returnType1,
                    params: params1,
                    statements: statements1,
                } = node1 as A.AstFunctionDef;
                const {
                    attributes: attributes2,
                    name: funcName2,
                    return: returnType2,
                    params: params2,
                    statements: statements2,
                } = node2 as A.AstFunctionDef;
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
                } = node1 as A.AstAsmFunctionDef;
                const {
                    shuffle: shuffle2,
                    attributes: attributes2,
                    name: funcName2,
                    return: returnType2,
                    params: params2,
                    instructions: instructions2,
                } = node2 as A.AstAsmFunctionDef;
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
                } = node1 as A.AstFunctionDecl;
                const {
                    attributes: declAttributes2,
                    name: declName2,
                    return: declReturnType2,
                    params: declParams2,
                } = node2 as A.AstFunctionDecl;
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
                } = node1 as A.AstNativeFunctionDecl;
                const {
                    attributes: nativeAttributes2,
                    name: nativeName2,
                    nativeName: nativeFuncName2,
                    params: nativeParams2,
                    return: returnTy2,
                } = node2 as A.AstNativeFunctionDecl;
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
                } = node1 as A.AstConstantDef;
                const {
                    attributes: constAttributes2,
                    name: constName2,
                    type: constType2,
                    initializer: constInitializer2,
                } = node2 as A.AstConstantDef;
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
                } = node1 as A.AstConstantDecl;
                const {
                    attributes: constDeclAttributes2,
                    name: constDeclName2,
                    type: constDeclType2,
                } = node2 as A.AstConstantDecl;
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
                    node1 as A.AstStructDecl;
                const { name: structName2, fields: structFields2 } =
                    node2 as A.AstStructDecl;
                return (
                    this.compare(structName1, structName2) &&
                    this.compareArray(structFields1, structFields2)
                );
            }

            case "message_decl": {
                const { name: msgName1, fields: msgFields1 } =
                    node1 as A.AstMessageDecl;
                const { name: msgName2, fields: msgFields2 } =
                    node2 as A.AstMessageDecl;
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
                } = node1 as A.AstContract;
                const {
                    name: contractName2,
                    traits: contractTraits2,
                    attributes: contractAttributes2,
                    declarations: contractDeclarations2,
                } = node2 as A.AstContract;
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
                } = node1 as A.AstTrait;
                const {
                    name: traitName2,
                    traits: traits2,
                    attributes: attributes2,
                    declarations: declarations2,
                } = node2 as A.AstTrait;
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
                } = node1 as A.AstFieldDecl;
                const {
                    name: fieldName2,
                    type: fieldType2,
                    initializer: fieldInitializer2,
                    as: as2,
                } = node2 as A.AstFieldDecl;
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
                } = node1 as A.AstReceiver;
                const {
                    selector: receiverSelector2,
                    statements: receiverStatements2,
                } = node2 as A.AstReceiver;
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
                    node1 as A.AstContractInit;
                const { params: initParams2, statements: initStatements2 } =
                    node2 as A.AstContractInit;
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
                } = node1 as A.AstStatementLet;
                const {
                    name: name2,
                    type: ty2,
                    expression: expr2,
                } = node2 as A.AstStatementLet;
                return (
                    this.compare(name1, name2) &&
                    this.compareNullableNodes(ty1, ty2) &&
                    this.compare(expr1, expr2)
                );
            }

            case "statement_return": {
                const { expression: expr1 } = node1 as A.AstStatementReturn;
                const { expression: expr2 } = node2 as A.AstStatementReturn;
                return this.compareNullableNodes(expr1, expr2);
            }

            case "statement_expression": {
                const { expression: expr1 } = node1 as A.AstStatementExpression;
                const { expression: expr2 } = node2 as A.AstStatementExpression;
                return this.compareNullableNodes(expr1, expr2);
            }

            case "statement_assign": {
                const { path: assignPath1, expression: assignExpression1 } =
                    node1 as A.AstStatementAssign;
                const { path: assignPath2, expression: assignExpression2 } =
                    node2 as A.AstStatementAssign;
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
                } = node1 as A.AstStatementAugmentedAssign;
                const {
                    op: augOp2,
                    path: augPath2,
                    expression: augExpression2,
                } = node2 as A.AstStatementAugmentedAssign;
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
                } = node1 as A.AstStatementCondition;
                const {
                    condition: cond2,
                    trueStatements: true2,
                    falseStatements: false2,
                    elseif: condElseIf2,
                } = node2 as A.AstStatementCondition;
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
                } = node1 as A.AstStatementWhile;
                const {
                    condition: loopCondition2,
                    statements: loopStatements2,
                } = node2 as A.AstStatementWhile;
                return (
                    this.compare(loopCondition1, loopCondition2) &&
                    this.compareArray(loopStatements1, loopStatements2)
                );
            }

            case "statement_until": {
                const {
                    condition: loopCondition1,
                    statements: loopStatements1,
                } = node1 as A.AstStatementUntil;
                const {
                    condition: loopCondition2,
                    statements: loopStatements2,
                } = node2 as A.AstStatementUntil;
                return (
                    this.compare(loopCondition1, loopCondition2) &&
                    this.compareArray(loopStatements1, loopStatements2)
                );
            }

            case "statement_repeat": {
                const { iterations: iter1, statements: stmts1 } =
                    node1 as A.AstStatementRepeat;
                const { iterations: iter2, statements: stmts2 } =
                    node2 as A.AstStatementRepeat;
                return (
                    this.compare(iter1, iter2) &&
                    this.compareArray(stmts1, stmts2)
                );
            }

            case "statement_try": {
                const {
                    statements: tryCatchStatements1,
                    catchBlock: catchBlock1,
                } = node1 as A.AstStatementTry;
                const {
                    statements: tryCatchStatements2,
                    catchBlock: catchBlock2,
                } = node2 as A.AstStatementTry;

                if (
                    !this.compareArray(tryCatchStatements1, tryCatchStatements2)
                ) {
                    return false;
                }

                if (catchBlock1 === undefined && catchBlock2 === undefined) {
                    return true;
                }

                if (catchBlock1 !== undefined && catchBlock2 !== undefined) {
                    const {
                        catchName: catchName1,
                        catchStatements: catchStatements1,
                    } = catchBlock1;

                    const {
                        catchName: catchName2,
                        catchStatements: catchStatements2,
                    } = catchBlock2;

                    return (
                        this.compare(catchName1, catchName2) &&
                        this.compareArray(catchStatements1, catchStatements2)
                    );
                }

                return false;
            }

            case "statement_foreach": {
                const {
                    keyName: forEachKeyName1,
                    valueName: forEachValueName1,
                    map: forEachMap1,
                    statements: forEachStatements1,
                } = node1 as A.AstStatementForEach;
                const {
                    keyName: forEachKeyName2,
                    valueName: forEachValueName2,
                    map: forEachMap2,
                    statements: forEachStatements2,
                } = node2 as A.AstStatementForEach;
                return (
                    this.compare(forEachKeyName1, forEachKeyName2) &&
                    this.compare(forEachValueName1, forEachValueName2) &&
                    this.compare(forEachMap1, forEachMap2) &&
                    this.compareArray(forEachStatements1, forEachStatements2)
                );
            }

            case "destruct_mapping": {
                const {
                    field: destructMappingField1,
                    name: destructMappingName1,
                } = node1 as A.AstDestructMapping;
                const {
                    field: destructMappingField2,
                    name: destructMappingName2,
                } = node2 as A.AstDestructMapping;
                return (
                    this.compare(
                        destructMappingField1,
                        destructMappingField2,
                    ) &&
                    this.compare(destructMappingName1, destructMappingName2)
                );
            }

            case "statement_destruct": {
                const {
                    type: destructType1,
                    identifiers: destructIdentifiers1,
                    expression: destructExpression1,
                } = node1 as A.AstStatementDestruct;
                const {
                    type: destructType2,
                    identifiers: destructIdentifiers2,
                    expression: destructExpression2,
                } = node2 as A.AstStatementDestruct;
                const sortedIdentifiers1 = Array.from(
                    destructIdentifiers1.values(),
                ).sort();
                const sortedIdentifiers2 = Array.from(
                    destructIdentifiers2.values(),
                ).sort();
                if (sortedIdentifiers1.length !== sortedIdentifiers2.length) {
                    return false;
                }
                for (let i = 0; i < sortedIdentifiers1.length; i++) {
                    if (
                        !this.compare(
                            sortedIdentifiers1[i]![0],
                            sortedIdentifiers2[i]![0],
                        ) ||
                        !this.compare(
                            sortedIdentifiers1[i]![1],
                            sortedIdentifiers2[i]![1],
                        )
                    ) {
                        return false;
                    }
                }
                return (
                    this.compare(destructType1, destructType2) &&
                    this.compare(destructExpression1, destructExpression2)
                );
            }

            case "statement_block": {
                const { statements: statements1 } =
                    node1 as A.AstStatementBlock;
                const { statements: statements2 } =
                    node2 as A.AstStatementBlock;
                return this.compareArray(statements1, statements2);
            }

            case "type_id": {
                const { text: typeIdText1 } = node1 as A.AstTypeId;
                const { text: typeIdText2 } = node2 as A.AstTypeId;
                return typeIdText1 === typeIdText2;
            }

            case "optional_type": {
                const { typeArg: optionalTypeArg1 } =
                    node1 as A.AstOptionalType;
                const { typeArg: optionalTypeArg2 } =
                    node2 as A.AstOptionalType;
                return this.compare(optionalTypeArg1, optionalTypeArg2);
            }

            case "map_type": {
                const {
                    keyType: mapKeyType1,
                    keyStorageType: mapKeyStorageType1,
                    valueType: mapValueType1,
                    valueStorageType: mapValueStorageType1,
                } = node1 as A.AstMapType;
                const {
                    keyType: mapKeyType2,
                    keyStorageType: mapKeyStorageType2,
                    valueType: mapValueType2,
                    valueStorageType: mapValueStorageType2,
                } = node2 as A.AstMapType;
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
                    node1 as A.AstBouncedMessageType;
                const { messageType: messageTy2 } =
                    node2 as A.AstBouncedMessageType;
                return this.compare(messageTy1, messageTy2);
            }

            case "op_binary": {
                const {
                    op: binaryOp1,
                    left: lhs1,
                    right: rhs1,
                } = node1 as A.AstOpBinary;
                const {
                    op: binaryOp2,
                    left: lhs2,
                    right: rhs2,
                } = node2 as A.AstOpBinary;
                return (
                    binaryOp1 === binaryOp2 &&
                    this.compare(lhs1, lhs2) &&
                    this.compare(rhs1, rhs2)
                );
            }

            case "op_unary": {
                const { op: op1, operand: operand1 } = node1 as A.AstOpUnary;
                const { op: op2, operand: operand2 } = node2 as A.AstOpUnary;
                return op1 === op2 && this.compare(operand1, operand2);
            }

            case "field_access": {
                const { aggregate: aggregate1, field: field1 } =
                    node1 as A.AstFieldAccess;
                const { aggregate: aggregate2, field: field2 } =
                    node2 as A.AstFieldAccess;
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
                } = node1 as A.AstMethodCall;
                const {
                    self: self2,
                    method: method2,
                    args: args2,
                } = node2 as A.AstMethodCall;
                return (
                    this.compare(self1, self2) &&
                    this.compare(method1, method2) &&
                    this.compareArray(args1, args2)
                );
            }

            case "static_call": {
                const { function: staticFunction1, args: staticArgs1 } =
                    node1 as A.AstStaticCall;
                const { function: staticFunction2, args: staticArgs2 } =
                    node2 as A.AstStaticCall;
                return (
                    this.compare(staticFunction1, staticFunction2) &&
                    this.compareArray(staticArgs1, staticArgs2)
                );
            }

            case "struct_instance": {
                const { type: ty1, args: args1 } = node1 as A.AstStructInstance;
                const { type: ty2, args: args2 } = node2 as A.AstStructInstance;
                return (
                    this.compare(ty1, ty2) && this.compareArray(args1, args2)
                );
            }

            case "init_of": {
                const { contract: initOfContract1, args: initOfArgs1 } =
                    node1 as A.AstInitOf;
                const { contract: initOfContract2, args: initOfArgs2 } =
                    node2 as A.AstInitOf;
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
                } = node1 as A.AstConditional;
                const {
                    condition: cond2,
                    thenBranch: then2,
                    elseBranch: else2,
                } = node2 as A.AstConditional;
                return (
                    this.compare(cond1, cond2) &&
                    this.compare(then1, then2) &&
                    this.compare(else1, else2)
                );
            }

            case "id": {
                const { text: text1 } = node1 as A.AstId;
                const { text: text2 } = node2 as A.AstId;
                return text1 === text2;
            }

            case "func_id": {
                const { text: text1 } = node1 as A.AstFuncId;
                const { text: text2 } = node2 as A.AstFuncId;
                return text1 === text2;
            }

            case "number": {
                const { value: val1 } = node1 as A.AstNumber;
                const { value: val2 } = node2 as A.AstNumber;
                return val1 === val2;
            }

            case "boolean": {
                const { value: val1 } = node1 as A.AstBoolean;
                const { value: val2 } = node2 as A.AstBoolean;
                return val1 === val2;
            }

            case "string": {
                const { value: val1 } = node1 as A.AstString;
                const { value: val2 } = node2 as A.AstString;
                return val1 === val2;
            }

            case "null": {
                return true;
            }

            case "typed_parameter": {
                const { name: name1, type: ty1 } = node1 as A.AstTypedParameter;
                const { name: name2, type: ty2 } = node1 as A.AstTypedParameter;
                return this.compare(name1, name2) && this.compare(ty1, ty2);
            }

            case "struct_field_initializer": {
                const { field: field1, initializer: initializer1 } =
                    node1 as A.AstStructFieldInitializer;
                const { field: field2, initializer: initializer2 } =
                    node2 as A.AstStructFieldInitializer;
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
        node1: A.AstNode | null,
        node2: A.AstNode | null,
    ): boolean {
        if (node1 === null || node2 === null) {
            return node1 === node2;
        }
        return this.compare(node1, node2);
    }

    private compareArray(nodes1: readonly A.AstNode[], nodes2: readonly A.AstNode[]): boolean {
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
        nodes1: readonly A.AstNode[] | null,
        nodes2: readonly A.AstNode[] | null,
    ): boolean {
        if (nodes1 === null || nodes2 === null) {
            return nodes1 === nodes2;
        }
        return this.compareArray(nodes1, nodes2);
    }

    private compareAsmInstructions(
        instructions1: readonly A.AstAsmInstruction[],
        instructions2: readonly A.AstAsmInstruction[],
    ): boolean {
        if (instructions1.length !== instructions2.length) {
            return false;
        }
        return instructions1.every((val1, i1) => val1 === instructions2[i1]);
    }

    private compareAttributes<
        T extends
            | A.AstFunctionAttribute
            | A.AstConstantAttribute
            | A.AstContractAttribute,
    >(attrs1: readonly T[], attrs2: readonly T[]): boolean {
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
        kind1: A.AstReceiverKind,
        kind2: A.AstReceiverKind,
    ): boolean {
        if (kind1.kind === "bounce" && kind2.kind === "bounce") {
            return this.compare(kind1.param, kind2.param);
        }
        if (kind1.kind === "internal" && kind2.kind === "internal") {
            return this.compareReceiverSubKinds(kind1.subKind, kind2.subKind);
        }
        if (kind1.kind === "external" && kind2.kind === "external") {
            return this.compareReceiverSubKinds(kind1.subKind, kind2.subKind);
        }
        return false;
    }

    private compareReceiverSubKinds(
        subKind1: A.AstReceiverSubKind,
        subKind2: A.AstReceiverSubKind,
    ): boolean {
        if (subKind1.kind === "simple" && subKind2.kind === "simple") {
            return this.compare(subKind1.param, subKind2.param);
        }
        if (subKind1.kind === "comment" && subKind2.kind === "comment") {
            return this.compare(subKind1.comment, subKind2.comment);
        }
        if (subKind1.kind === "fallback" && subKind2.kind === "fallback") {
            return true;
        }
        return false;
    }
}
