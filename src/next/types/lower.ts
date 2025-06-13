/* eslint-disable require-yield */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";

type Lower<T, U> = (t: T) => Ast.Log<undefined | U>

export const lowerSource: Lower<Ast.CSource, Ast.LSource> =
function* (node) {
    const typeDecls = yield* lowerTypeDecls(node.typeDecls);
    const functions = yield* lowerFunctions(node.functions);
    const constants = yield* lowerConstants(node.constants);
    const extensions = yield* lowerExtensions(node.extensions);
    return typeDecls && functions && constants && extensions &&
        Ast.LSource(typeDecls, functions, constants, extensions);
}

const lowerTypeDecls: Lower<
    ReadonlyMap<string, Ast.Decl<Ast.CTypeDecl>>,
    ReadonlyMap<string, Ast.LTypeDecl>
> = function* (decls) {
    let failed = false;
    const result: Map<string, Ast.LTypeDecl> = new Map();
    for (const [name, decl] of [...decls]) {
        const res = yield* lowerTypeDecl(decl.decl);
        if (res) {
            result.set(name, res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : result;
}

const lowerTypeDecl: Lower<Ast.CTypeDecl, Ast.LTypeDecl> =
function (node) {
    switch (node.kind) {
        case "alias": return lowerAlias(node);
        case "contract": return lowerContract(node);
        case "trait": return lowerTrait(node);
        case "struct": return lowerStruct(node);
        case "message": return lowerMessage(node);
        case "union": return lowerUnion(node);
    }
}

const lowerAlias: Lower<Ast.CAlias, Ast.LAlias> =
function* (node) {
    const type = yield* lowerType(yield* node.type());
    return type && Ast.LAlias(node.typeParams, type);
}

const lowerContract: Lower<Ast.CContract, Ast.LContract> =
function* (node) {
    const init = yield* lowerInit(node.init);
    const members = yield* lowerContractMembers(node.content);
    return init && members && Ast.LContract(node.attributes, init, members);
}

const lowerInit: Lower<Ast.CInit, Ast.LInit> = function (node) {
    switch (node.kind) {
        case "function": return lowerInitFunction(node);
        case "empty": return lowerInitEmpty(node);
        case "simple": return lowerInitSimple(node);
    }
}

const lowerInitFunction: Lower<Ast.CInitFn, Ast.LInitFn> =
function* (node) {
    const params = yield* lowerParameters(node.params);
    const stmts = yield* lowerStatements(node.statements);
    return params && stmts && Ast.LInitFn(params, stmts);
}

const lowerInitEmpty: Lower<Ast.CInitEmpty, Ast.LInitEmpty> =
function* (node) {
    const old = yield* node.fill();
    if (!old) {
        return undefined;
    }
    let failed = false;
    const map: Map<string, Ast.Value> = new Map();
    for (const [name, param] of old.map) {
        const res = yield* param();
        if (res) {
            map.set(name, res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : Ast.LInitEmpty(Ast.Ordered(old.order, map));
}

const lowerInitSimple: Lower<Ast.CInitSimple, Ast.LInitSimple> =
function* (node) {
    const map: Map<string, Ast.LInitParam> = new Map();
    let failed = false;
    for (const [name, field] of node.fill.map) {
        const type = yield* lowerType(yield* field.type());
        if (!type) {
            failed = true;
        }
        if (field.init) {
            const init = yield* field.init();
            if (!init) {
                failed = true;
            }
            if (init && type) {
                map.set(name, Ast.LInitParam(type, init, field.loc));
            }
        } else if (type) {
            map.set(name, Ast.LInitParam(type, undefined, field.loc));
        }
    }
    return failed
        ? undefined
        : Ast.LInitSimple(Ast.Ordered(node.fill.order, map), node.loc);
}

const lowerContractMembers: Lower<
    Ast.Thunk<Ast.CContractMembers>,
    Ast.LContractMembers
> = function* (thunk) {
    const members = yield* thunk();
    const fieldish = yield* lowerFieldish(members.fieldish);
    const methods = yield* lowerMethods(members.methods);
    const receivers = yield* lowerReceivers(members.receivers);
    return fieldish && methods && receivers && { fieldish, methods, receivers };
}

const lowerFieldish: Lower<
    Ast.Ordered<Ast.DeclMem<Ast.CFieldish<Ast.Thunk<Ast.Recover<Ast.Value>>>>>,
    Ast.Ordered<Ast.LFieldish<Ast.Value>>
> =
function* (node) {
    let failed = false;
    const map: Map<string, Ast.LFieldish<Ast.Value>> = new Map();
    for (const [name, { decl }] of node.map) {
        switch (decl.kind) {
            case "field": {
                const field = yield* lowerField(decl);
                if (field) {
                    map.set(name, field);
                } else {
                    failed = true;
                }
                continue;
            }
            case "constant": {
                const constant = yield* lowerConstant(decl);
                if (constant) {
                    map.set(name, constant);
                } else {
                    failed = true;
                }
                continue;
            }
        }
    }
    return failed ? undefined : Ast.Ordered(node.order, map);
}

const lowerField: Lower<Ast.CField, Ast.LField> =
function* (node) {
    const type = yield* lowerType(yield* node.type());
    if (node.init) {
        const init = yield* node.init();
        if (!init) {
            return undefined;
        }
        return type && Ast.LField(type, init);
    } else {
        return type && Ast.LField(type, undefined);
    }
}

const lowerConstant: Lower<
    Ast.CFieldConstant<Ast.Thunk<Ast.Recover<Ast.Value>>>,
    Ast.LFieldConstant<Ast.Value>
> = function* (node) {
    const init = yield* node.init();
    const type = yield* lowerType(yield* node.type());
    return type && init && Ast.LFieldConstant(type, init);
};

const lowerMethods: Lower<
    ReadonlyMap<string, Ast.DeclMem<Ast.CMethod<Ast.CBody>>>,
    ReadonlyMap<string, Ast.LMethod<Ast.LBody>>
> = function* (node) {
    let failed = false;
    const map: Map<string, Ast.LMethod<Ast.LBody>> = new Map();
    for (const [name, { decl }] of node) {
        const type = yield* lowerMethodType(decl.type);
        const body = yield* lowerBody(decl.body);
        const getMethodId = decl.getMethodId && (yield* decl.getMethodId());
        if (type && body && (!decl.getMethodId || getMethodId)) {
            map.set(name, Ast.LMethod<Ast.LBody>(
                type, 
                decl.inline, 
                body, 
                getMethodId,
            ));
        } else {
            failed = true;
        }
    }
    return failed ? undefined : map;
}

const lowerMethodType: Lower<Ast.CTMethod, Ast.LTMethod> =
function* (node) {
    const params = yield* lowerParameters(node.params);
    const returnType = yield* lowerType(yield* node.returnType());
    return params && returnType && Ast.LTMethod(
        node.mutates, 
        node.typeParams, 
        node.self, 
        params,
        returnType,
    );
};

const lowerBody: Lower<Ast.CBody, Ast.LBody> =
function (node) {
    switch (node.kind) {
        case "tact": return lowerBodyTact(node);
        case "func": return lowerBodyFunc(node);
        case "fift": return lowerBodyFift(node);
    }
};

const lowerBodyTact: Lower<Ast.CTactBody, Ast.LTactBody> =
function* (node) {
    const stmts = yield* lowerStatements(node.statements);
    return stmts && Ast.LTactBody(stmts);
}
const lowerBodyFunc: Lower<Ast.CFuncBody, Ast.LFuncBody> =
function* (node) {
    return Ast.LFuncBody(node.nativeName);
}
const lowerBodyFift: Lower<Ast.CFiftBody, Ast.LFiftBody> =
function* (node) {
    const shuffle = yield* node.shuffle();
    return shuffle && Ast.LFiftBody(shuffle, node.instructions);
}

const lowerReceivers: Lower<Ast.CReceivers, Ast.LReceivers> =
function* (node) {
    const bounce = yield* lowerBounce(node.bounce);
    const internal = yield* lowerReceiver(node.internal);
    const external = yield* lowerReceiver(node.external);
    return bounce && internal && external && Ast.LReceivers(bounce, internal, external);
}

const lowerBounce: Lower<Ast.CBounce, Ast.LBounce> =
function* (node) {
    const message = yield* mapRecv(lowerRecvMessage)(node.message);
    const messageAny = node.messageAny
        ? (yield* lowerRecvAny(node.messageAny.decl))
        : undefined;
    return typeof message === 'undefined'
        ? undefined
        : (!node.messageAny || messageAny) &&
        Ast.LBounce(message, messageAny);
}

const mapRecv = <T, U>(
    cb: Lower<T, U>
): Lower<
    readonly Ast.DeclMem<T>[], 
    readonly U[]
> =>
function* (nodes) {
    let failed = false;
    const message: U[] = [];
    for (const { decl } of nodes) {
        const res = yield* cb(decl);
        if (res) {
            message.push(res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : message;
};

const lowerRecvMessage: Lower<
    Ast.CReceiverMessage,
    Ast.LReceiverMessage
> = function* (node) {
    const statements = yield* lowerStatements(node.statements);
    const type = yield* lowerTypeRefOrBounced(node.type);
    return statements && type && Ast.LReceiverMessage(
        node.name,
        type,
        statements,
    )
};

const lowerTypeRefOrBounced: Lower<
    Ast.CTRef | Ast.CTBounced,
    Ast.LTRef | Ast.LTBounced
> = function (node) {
    switch (node.kind) {
        case "type_ref": return lowerTypeRef(node);
        case "TypeBounced": return lowerTypeBounced(node);
    }
};

const lowerReceiver: Lower<
    Ast.CReceiver,
    Ast.LReceiver
> = function* (node) {
    const message = yield* mapRecv(lowerRecvOpcode)(node.message);
    const messageAny = node.messageAny
        ? (yield* lowerRecvAny(node.messageAny.decl))
        : undefined;
    const stringAny = node.stringAny
        ? (yield* lowerRecvAny(node.stringAny.decl))
        : undefined;
    const empty = node.empty
        ? (yield* lowerRecvEmpty(node.empty.decl))
        : undefined;
    return typeof message === 'undefined'
        ? undefined
        : (!node.messageAny || messageAny) &&
          (!node.stringAny || stringAny) &&
            Ast.LReceiver(message, messageAny, stringAny, empty);
};

const lowerRecvAny: Lower<Ast.CReceiverMessageAny | Ast.CReceiverStringAny, Ast.LReceiverAny> =
function* (node) {
    const statements = yield* lowerStatements(node.statements);
    if (!statements) {
        return undefined;
    }
    return Ast.LReceiverAny(node.name, statements);
}
const lowerRecvEmpty: Lower<Ast.CReceiverEmpty, Ast.LReceiverEmpty> =
function* (node) {
    const statements = yield* lowerStatements(node.statements);
    if (!statements) {
        return undefined;
    }
    return Ast.LReceiverEmpty(statements);
}

const lowerRecvOpcode: Lower<
    Ast.CReceiverOpcode, 
    Ast.LReceiverOpcode
> = function* (node) {
    switch (node.kind) {
        case "string": {
            const statements = yield* lowerStatements(node.statements);
            return statements && Ast.LReceiverString(node.comment, statements);
        }
        case "binary": {
            const type = yield* lowerTypeRefOrBounced(node.type);
            const statements = yield* lowerStatements(node.statements);
            return type && statements && Ast.LReceiverMessage(node.name, type, statements);
        }
    }
};

const lowerTrait: Lower<Ast.CTrait, Ast.LTrait> =
function* (node) {
    const content = yield* node.content();
    const fieldish = yield* lowerFieldishTrait(content.fieldish);
    const methods = yield* lowerMethodsTrait(content.methods);
    const receivers = yield* lowerReceivers(content.receivers);
    return fieldish && methods && receivers && Ast.LTrait({ fieldish, methods, receivers });
}

const lowerMethodsTrait: Lower<
    ReadonlyMap<string, Ast.DeclMem<Ast.CMethod<Ast.CBody | undefined>>>,
    ReadonlyMap<string, Ast.LMethod<Ast.LBody | undefined>>
> = function* (node) {
    let failed = false;
    const map: Map<string, Ast.LMethod<Ast.LBody | undefined>> = new Map();
    for (const [name, { decl }] of node) {
        const type = yield* lowerMethodType(decl.type);
        const body = decl.body ? (yield* lowerBody(decl.body)) : undefined;
        const getMethodId = decl.getMethodId && (yield* decl.getMethodId());
        if (type && (!decl.body || body) && (!decl.getMethodId || getMethodId)) {
            map.set(name, Ast.LMethod<Ast.LBody | undefined>(
                type, 
                decl.inline, 
                body, 
                getMethodId,
            ));
        } else {
            failed = true;
        }
    }
    return failed ? undefined : map;
}

const lowerFieldishTrait: Lower<
    Ast.Ordered<Ast.DeclMem<Ast.CFieldish<undefined | Ast.Thunk<Ast.Recover<Ast.Value>>>>>,
    Ast.Ordered<Ast.LFieldish<undefined | Ast.Value>>
> =
function* (node) {
    let failed = false;
    const map: Map<string, Ast.LFieldish<undefined | Ast.Value>> = new Map();
    for (const [name, { decl }] of node.map) {
        switch (decl.kind) {
            case "field": {
                const field = yield* lowerField(decl);
                if (field) {
                    map.set(name, field);
                } else {
                    failed = true;
                }
                continue;
            }
            case "constant": {
                const constant = yield* lowerConstantTrait(decl);
                if (constant) {
                    map.set(name, constant);
                } else {
                    failed = true;
                }
                continue;
            }
        }
    }
    return failed ? undefined : Ast.Ordered(node.order, map);
}

const lowerConstantTrait: Lower<
    Ast.CFieldConstant<Ast.Thunk<Ast.Recover<Ast.Value>> | undefined>,
    Ast.LFieldConstant<Ast.Value | undefined>
> = function* (node) {
    const init = node.init ? (yield* node.init()) : undefined;
    const type = yield* lowerType(yield* node.type());
    return type && (!node.init || init) && Ast.LFieldConstant(type, init);
};

const lowerStruct: Lower<Ast.CStruct, Ast.LStruct> =
function* (node) {
    const fields = yield* lowerFields(node.fields);
    return fields && Ast.LStruct(node.typeParams, fields);
}

const lowerFields: Lower<Ast.Ordered<Ast.CField>, Ast.Ordered<Ast.LField>> =
function* (node) {
    let failed = false;
    const map: Map<string, Ast.LField> = new Map();
    for (const [name, field] of node.map) {
        const type = yield* lowerType(yield* field.type());
        const init = field.init ? (yield* field.init()) : undefined;
        if (type && (!field.init || init)) {
            map.set(name, Ast.LField(type, init));
        } else {
            failed = true;
        }
    }
    return failed ? undefined : Ast.Ordered(node.order, map);
}

const lowerMessage: Lower<Ast.CMessage, Ast.LMessage> =
function* (node) {
    const opcode = yield* node.opcode();
    const fields = yield* lowerFields(node.fields);
    return typeof opcode === 'undefined'
        ? undefined
        : fields && Ast.LMessage(opcode, fields);
}

const lowerUnion: Lower<Ast.CUnion, Ast.LUnion> =
function* (node) {
    let failed = false;
    const cases: Map<string, ReadonlyMap<string, Ast.LField>> = new Map();
    for (const [caseName, rawFields] of node.cases) {
        const fields: Map<string, Ast.LField> = new Map();
        for (const [fieldName, field] of rawFields) {
            const type = yield* lowerType(yield* field.type());
            const init = field.init ? (yield* field.init()) : undefined;
            if (type && (!field.init || init)) {
                fields.set(fieldName, Ast.LField(type, init));
            } else {
                failed = true;
            }
        }
        cases.set(caseName, fields);
    }
    return failed ? undefined : Ast.LUnion(node.typeParams, cases);
}

const lowerFunctions: Lower<
    ReadonlyMap<string, Ast.Decl<Ast.CFunction>>,
    ReadonlyMap<string, Ast.LFunction>
> = function* (decls) {
    let failed = false;
    const result: Map<string, Ast.LFunction> = new Map();
    for (const [name, { decl }] of decls) {
        const type = yield* lowerFunctionType(decl.type);
        const body = yield* lowerBody(decl.body);
        if (type && body) {
            result.set(name, Ast.LFunction(type, decl.inline, body));
        } else {
            failed = true;
        }
    }
    return failed ? undefined : result;
}

const lowerFunctionType: Lower<Ast.CTFunction, Ast.LTFunction> = function* (node) {
    const params = yield* lowerParameters(node.params);
    const returnType = yield* lowerType(yield* node.returnType());
    return params && returnType && Ast.LTFunction(node.typeParams, params, returnType);
}

const lowerConstants: Lower<
    ReadonlyMap<string, Ast.Decl<Ast.CConstant>>,
    ReadonlyMap<string, Ast.LConstant>
> = function* (decls) {
    let failed = false;
    const result: Map<string, Ast.LConstant> = new Map();
    for (const [name, { decl }] of decls) {
        const type = yield* lowerType(yield* decl.type());
        const initializer = yield* decl.initializer();
        if (type && initializer) {
            result.set(name, Ast.LConstant(initializer, type));
        } else {
            failed = true;
        }
    }
    return failed ? undefined : result;
}

const lowerExtensions: Lower<
    ReadonlyMap<string, Ast.Thunk<readonly Ast.Decl<Ast.CExtension>[]>>,
    ReadonlyMap<string, readonly Ast.LExtension[]>
> = function* (decls) {
    let failed = false;
    const result: Map<string, readonly Ast.LExtension[]> = new Map();
    for (const [name, thunk] of decls) {
        const extensions = yield* thunk();
        const exts: Ast.LExtension[] = [];
        for (const { decl: extension } of extensions) {
            const type = yield* lowerMethodType(extension.type);
            const body = yield* lowerBody(extension.body);
            if (type && body) {
                exts.push(Ast.LExtension(type, extension.inline, body));
            } else {
                failed = true;
            }
        }
        result.set(name, exts);
    }
    return failed ? undefined : result;
}

const lowerStatements: Lower<Ast.CStatements, Ast.LStatements> =
function* (node) {
    const stmts = yield* node();
    if (!stmts) {
        return undefined;
    }
    const body = yield* lowerStatementList(stmts.body);
    return typeof body === 'undefined'
        ? undefined 
        : Ast.LStatements(body, stmts.effects);
}

const lowerStatementList: Lower<readonly Ast.CStmt[], readonly Ast.LStmt[]> =
function* (stmts) {
    let failed = false;
    const result: Ast.LStmt[] = [];
    for (const stmt of stmts) {
        const lowered = yield* lowerStatement(stmt);
        if (lowered) {
            result.push(lowered);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : result;
}

const lowerStatement: Lower<Ast.CStmt, Ast.LStmt> =
function (node) {
    switch (node.kind) {
        case "statement_let": return lowerStatementLet(node);
        case "statement_return": return lowerStatementReturn(node);
        case "statement_expression": return lowerStatementExpression(node);
        case "statement_assign": return lowerStatementAssign(node);
        case "statement_augmentedassign": return lowerStatementAugmentedAssign(node);
        case "statement_condition": return lowerStatementCondition(node);
        case "statement_while": return lowerStatementWhile(node);
        case "statement_until": return lowerStatementUntil(node);
        case "statement_repeat": return lowerStatementRepeat(node);
        case "statement_try": return lowerStatementTry(node);
        case "statement_foreach": return lowerStatementForEach(node);
        case "statement_destruct": return lowerStatementDestruct(node);
        case "statement_block": return lowerStatementBlock(node);
    }
}

const lowerStatementLet: Lower<Ast.CStmtLet, Ast.LStmtLet> =
function* (node) {
    const expr = yield* lowerExpr(node.expression);
    return expr && Ast.LStmtLet(node.name, expr, node.loc);
}

const lowerStatementReturn: Lower<Ast.CStmtReturn, Ast.LStmtReturn> =
function* (node) {
    const expr = node.expression ? (yield* lowerExpr(node.expression)) : undefined;
    return (!node.expression || expr) && Ast.LStmtReturn(expr, node.loc);
}

const lowerStatementExpression: Lower<Ast.CStmtExpression, Ast.LStmtExpression> =
function* (node) {
    const expr = yield* lowerExpr(node.expression);
    return expr && Ast.LStmtExpression(expr, node.loc);
}

const lowerStatementAssign: Lower<Ast.CStmtAssign, Ast.LStmtAssign> =
function* (node) {
    const path = yield* lowerLValue(node.path);
    const expr = yield* lowerExpr(node.expression);
    return path && expr && Ast.LStmtAssign(path, expr, node.loc);
}

const lowerStatementAugmentedAssign: Lower<Ast.CStmtAugmentedAssign, Ast.LStmtAugmentedAssign> =
function* (node) {
    const path = yield* lowerLValue(node.path);
    const expr = yield* lowerExpr(node.expression);
    return path && expr && Ast.LStmtAugmentedAssign(node.op, path, expr, node.loc);
}

const lowerStatementCondition: Lower<Ast.CStmtCondition, Ast.LStmtCondition> =
function* (node) {
    const condition = yield* lowerExpr(node.condition);
    const thenBranch = yield* lowerStatementList(node.trueStatements);
    const elseBranch = node.falseStatements
        ? (yield* lowerStatementList(node.falseStatements))
        : undefined;
    return condition && thenBranch && (!node.falseStatements || elseBranch) &&
        Ast.LStmtCondition(condition, thenBranch, elseBranch, node.loc);
}

const lowerStatementWhile: Lower<Ast.CStmtWhile, Ast.LStmtWhile> =
function* (node) {
    const condition = yield* lowerExpr(node.condition);
    const body = yield* lowerStatementList(node.statements);
    return condition && body && Ast.LStmtWhile(condition, body, node.loc);
}

const lowerStatementUntil: Lower<Ast.CStmtUntil, Ast.LStmtUntil> =
function* (node) {
    const condition = yield* lowerExpr(node.condition);
    const body = yield* lowerStatementList(node.statements);
    return condition && body && Ast.LStmtUntil(condition, body, node.loc);
}

const lowerStatementRepeat: Lower<Ast.CStmtRepeat, Ast.LStmtRepeat> =
function* (node) {
    const body = yield* lowerStatementList(node.statements);
    const iterations = yield* lowerExpr(node.iterations);
    return body && iterations && Ast.LStmtRepeat(iterations, body, node.loc);
}

const lowerStatementTry: Lower<Ast.CStmtTry, Ast.LStmtTry> =
function* (node) {
    const body = yield* lowerStatementList(node.statements);
    const catchBlock = node.catchBlock
        ? (yield* lowerCatchBlock(node.catchBlock))
        : undefined;
    return body && (!node.catchBlock || catchBlock) &&
        Ast.LStmtTry(body, catchBlock, node.loc);
}

const lowerCatchBlock: Lower<Ast.CCatchBlock, Ast.LCatchBlock> =
function* (node) {
    const body = yield* lowerStatementList(node.statements);
    return body && Ast.LCatchBlock(node.name, body);
}

const lowerStatementForEach: Lower<Ast.CStmtForEach, Ast.LStmtForEach> =
function* (node) {
    const expr = yield* lowerExpr(node.map);
    const body = yield* lowerStatementList(node.statements);
    return expr && body && Ast.LStmtForEach(node.keyName, node.valueName, expr, body, node.loc);
}

const lowerStatementDestruct: Lower<Ast.CStmtDestruct, Ast.LStmtDestruct> =
function* (node) {
    const expr = yield* lowerExpr(node.expression);
    const patterns = yield* lowerDestructPatterns(node.identifiers);
    return expr && patterns && Ast.LStmtDestruct(
        node.type,
        patterns,
        node.ignoreUnspecifiedFields,
        expr,
        node.loc,
    );
}

const lowerDestructPatterns: Lower<
    Ast.Ordered<Ast.CDestructPattern>,
    Ast.Ordered<Ast.LDestructPattern>
> = function* (patterns) {
    return patterns;
}

const lowerStatementBlock: Lower<Ast.CStmtBlock, Ast.LStmtBlock> =
function* (node) {
    const body = yield* lowerStatementList(node.statements);
    return body && Ast.LStmtBlock(body, node.loc);
}

const lowerParameters: Lower<Ast.CParameters, Ast.LParameters> =
function* (node) {
    const order = yield* Ast.mapLog(node.order, param => lowerParameter(param));
    const filtered: Ast.LParameter[] = [];
    let failed = false;
    for (const param of order) {
        if (param) {
            filtered.push(param);
        } else {
            failed = true;
        }
    }
    return failed
        ? undefined
        : order && Ast.LParameters(filtered, node.set);
}

const lowerLValue: Lower<Ast.LValue, Ast.LLValue> =
function (node) {
    switch (node.kind) {
        case "var": return lowerLVar(node);
        case "self": return lowerLSelf(node);
        case "field_access": return lowerLFieldAccess(node);
    }
}

const lowerLVar: Lower<Ast.CLVar, Ast.LLVar> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    return type && Ast.LLVar(node.name, type, node.loc);
}

const lowerLSelf: Lower<Ast.CLSelf, Ast.LLSelf> =
function* (node) {
    return Ast.LLSelf(node.computedType, node.loc);
}

const lowerLFieldAccess: Lower<Ast.CLFieldAccess, Ast.LLFieldAccess> =
function* (node) {
    const aggregate = yield* lowerLValue(node.aggregate);
    const type = yield* lowerType(node.computedType);
    return aggregate && type &&
        Ast.LLFieldAccess(aggregate, node.field, type, node.loc);
}

const lowerExpr: Lower<Ast.CExpr, Ast.LExpr> =
function (node) {
    switch (node.kind) {
        case "string": return lowerString(node);
        case "number": return lowerNumber(node);
        case "boolean": return lowerBoolean(node);
        case "op_binary": return lowerOpBinary(node);
        case "op_unary": return lowerOpUnary(node);
        case "conditional": return lowerConditional(node);
        case "method_call": return lowerMethodCall(node);
        case "static_call": return lowerStaticCall(node);
        case "static_method_call": return lowerStaticMethodCall(node);
        case "field_access": return lowerFieldAccess(node);
        case "struct_instance": return lowerStructInstance(node);
        case "init_of": return lowerInitOf(node);
        case "code_of": return lowerCodeOf(node);
        case "null": return lowerNull(node);
        case "var": return lowerVar(node);
        case "self": return lowerSelf(node);
        case "unit": return lowerUnit(node);
        case "tuple": return lowerTuple(node);
        case "tensor": return lowerTensor(node);
        case "map_literal": return lowerMapLiteral(node);
        case "set_literal": return lowerSetLiteral(node);
    }
}

const lowerTypeArgs: Lower<Ast.TypeArgs, Ast.LTypeArgs> =
function* (args) {
    let failed = false;
    const map: Map<string, Ast.LType> = new Map();
    for (const [name, type] of args) {
        const res = yield* lowerType(type);
        if (res) {
            map.set(name, res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : map;
};

const lowerExprs: Lower<readonly Ast.CExpr[], readonly Ast.LExpr[]> =
function* (nodes) {
    let failed = false;
    const result: Ast.LExpr[] = [];
    for (const node of nodes) {
        const res = yield* lowerExpr(node);
        if (res) {
            result.push(res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : result;
};

const lowerString: Lower<Ast.CString, Ast.LString> =
function* (node) {
    const type = yield* lowerTypeBasic(node.computedType);
    return type && Ast.LString(node.value, type, node.loc);
}
const lowerNumber: Lower<Ast.CNumber, Ast.LNumber> =
function* (node) {
    const type = yield* lowerTypeBasic(node.computedType);
    return type && Ast.LNumber(node.base, node.value, type, node.loc);
}
const lowerBoolean: Lower<Ast.CBoolean, Ast.LBoolean> =
function* (node) {
    const type = yield* lowerTypeBasic(node.computedType);
    return type && Ast.LBoolean(node.value, type, node.loc);
}
const lowerOpBinary: Lower<Ast.COpBinary, Ast.LOpBinary> =
function* (node) {
    const left = yield* lowerExpr(node.left);
    const right = yield* lowerExpr(node.right);
    const typeArgs = yield* lowerTypeArgs(node.typeArgs);
    const type = yield* lowerType(node.computedType);
    return left && right && type && typeArgs && 
        Ast.LOpBinary(
            node.op,
            left,
            right,
            typeArgs,
            type,
            node.loc,
        );
}
const lowerOpUnary: Lower<Ast.COpUnary, Ast.LOpUnary> =
function* (node) {
    const operand = yield* lowerExpr(node.operand);
    const typeArgs = yield* lowerTypeArgs(node.typeArgs);
    const type = yield* lowerType(node.computedType);
    return operand && type && typeArgs &&
        Ast.LOpUnary(
            node.op,
            operand,
            typeArgs,
            type,
            node.loc,
        );
}
const lowerConditional: Lower<Ast.CConditional, Ast.LConditional> =
function* (node) {
    const condition = yield* lowerExpr(node.condition);
    const thenBranch = yield* lowerExpr(node.thenBranch);
    const elseBranch = yield* lowerExpr(node.elseBranch);
    const type = yield* lowerType(node.computedType);
    return condition && thenBranch && elseBranch && type &&
        Ast.LConditional(condition, thenBranch, elseBranch, type, node.loc);
}
const lowerMethodCall: Lower<Ast.CMethodCall, Ast.LMethodCall> =
function* (node) {
    const self = yield* lowerExpr(node.self);
    const typeArgs = yield* lowerTypeArgs(node.typeArgs);
    const args = yield* lowerExprs(node.args);
    const computedType = yield* lowerType(node.computedType);
    return self && typeArgs && args && computedType &&
        Ast.LMethodCall(
            self,
            node.method,
            args,
            typeArgs,
            computedType,
            node.loc,
        );
}
const lowerStaticCall: Lower<Ast.CStaticCall, Ast.LStaticCall> =
function* (node) {
    const typeArgs = yield* lowerTypeArgs(node.typeArgs);
    const args = yield* lowerExprs(node.args);
    const computedType = yield* lowerType(node.computedType);
    return typeArgs && args && computedType &&
        Ast.LStaticCall(
            node.function,
            typeArgs,
            args,
            computedType,
            node.loc,
        );
}
const lowerStaticMethodCall: Lower<Ast.CStaticMethodCall, Ast.LStaticMethodCall> =
function* (node) {
    const typeArgs = yield* lowerTypeArgs(node.typeArgs);
    const args = yield* lowerExprs(node.args);
    const computedType = yield* lowerType(node.computedType);
    return typeArgs && args && computedType &&
        Ast.LStaticMethodCall(
            node.self,
            typeArgs,
            node.function,
            args,
            computedType,
            node.loc,
        );
}
const lowerFieldAccess: Lower<Ast.CFieldAccess, Ast.LFieldAccess> =
function* (node) {
    const aggregate = yield* lowerExpr(node.aggregate);
    const type = yield* lowerType(node.computedType);
    return aggregate && type &&
        Ast.LFieldAccess(
            aggregate,
            node.field,
            type,
            node.loc,
        );
}
const lowerStructInstance: Lower<Ast.CStructCons, Ast.LStructCons> =
function* (node) {
    if (node.computedType.kind === 'recover') {
        return undefined;
    }
    const type = yield* lowerTypeRef(node.computedType);
    const result: Map<string, Ast.LExpr> = new Map();
    let failed = false;
    for (const name of node.fields.order) {
        const field = node.fields.map.get(name);
        if (!field) {
            return throwInternal("Ordered<>: lost field");
        }
        const res = yield* lowerExpr(field);
        if (res) {
            result.set(name, res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : type &&
        Ast.LStructCons(
            Ast.Ordered(node.fields.order, result),
            type,
            node.loc,
        );
}
const lowerInitOf: Lower<Ast.CInitOf, Ast.LInitOf> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    const fields = yield* Ast.mapLog(node.fields, lowerExpr);
    return type && fields &&
        Ast.LInitOf(
            node.name,
            type,
            fields,
            node.loc,
        );
}
const lowerCodeOf: Lower<Ast.CCodeOf, Ast.LCodeOf> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    const fields = yield* Ast.mapLog(node.fields, lowerExpr);
    return type && fields &&
        Ast.LCodeOf(
            node.name,
            type,
            fields,
            node.loc,
        );
}
const lowerNull: Lower<Ast.CNull, Ast.LNull> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    return type && Ast.LNull(type, node.loc);
}
const lowerVar: Lower<Ast.CVar, Ast.LVar> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    return type && Ast.LVar(node.name, type, node.loc);
}
const lowerSelf: Lower<Ast.CSelf, Ast.LSelf> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    return type && Ast.LSelf(type, node.loc);
}
const lowerUnit: Lower<Ast.CUnit, Ast.LUnit> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    return type && Ast.LUnit(type, node.loc);
}
const lowerTuple: Lower<Ast.CTuple, Ast.LTuple> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    const elements = yield* Ast.mapLog(node.elements, lowerExpr);
    return type && elements &&
        Ast.LTuple(
            node.name,
            type,
            elements,
            node.loc,
        );
}
const lowerTensor: Lower<Ast.CTensor, Ast.LTensor> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    const elements = yield* Ast.mapLog(node.elements, lowerExpr);
    return type && elements &&
        Ast.LTensor(
            node.name,
            type,
            node.dimensions,
            elements,
            node.loc,
        );
}
const lowerMapLiteral: Lower<Ast.CMapLiteral, Ast.LMapLiteral> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    const entries = yield* Ast.mapLog(node.entries, entry => {
        return Ast.mapLog(entry, lowerExpr);
    });
    return type && entries &&
        Ast.LMapLiteral(
            node.name,
            type,
            entries,
            node.loc,
        );
}
const lowerSetLiteral: Lower<Ast.CSetLiteral, Ast.LSetLiteral> =
function* (node) {
    const type = yield* lowerType(node.computedType);
    const elements = yield* Ast.mapLog(node.elements, lowerExpr);
    return type && elements &&
        Ast.LSetLiteral(
            node.name,
            type,
            elements,
            node.loc,
        );
}

const lowerParameter: Lower<Ast.CParameter, Ast.LParameter> =
function* (node) {
    const type = yield* lowerType(yield* node.type());
    return type && Ast.LParameter(node.name, type, node.loc);
}

const lowerType: Lower<Ast.CType, Ast.LType> =
function* (node) {
    switch (node.kind) {
        case "recover": return undefined;
        case "type_ref": return lowerTypeRef(node);
        case "TypeAlias": return lowerTypeAliasRef(node);
        case "TypeParam": return lowerTypeParam(node);
        case "map_type": return lowerTypeMap(node);
        case "TypeBounced": return lowerTypeBounced(node);
        case "TypeMaybe": return lowerTypeMaybe(node);
        case "tuple_type": return lowerTypeTuple(node);
        case "tensor_type": return lowerTypeTensor(node);
        case "basic": return lowerTypeBasic(node);
    }
}

const lowerTypes: Lower<readonly Ast.CType[], readonly Ast.LType[]> =
function* (nodes) {
    let failed = false;
    const result: Ast.LType[] = [];
    for (const node of nodes) {
        const res = yield* lowerType(node);
        if (res) {
            result.push(res);
        } else {
            failed = true;
        }
    }
    return failed ? undefined : result;
};

const lowerTypeRef: Lower<Ast.CTRef, Ast.LTRef> =
function* (node) {
    const args = yield* lowerTypes(node.typeArgs);
    return args && Ast.LTRef(node.name, node.type, args, node.loc);
};

const lowerTypeAliasRef: Lower<Ast.CTAliasRef, Ast.LTAliasRef> =
function* (node) {
    if (node.type.kind === 'NotDealiased') {
        return throwInternal("Non-dealiased type in lowering");
    }
    const type = yield* lowerType(node.type);
    const args = yield* lowerTypes(node.typeArgs);
    return type && args && Ast.LTAliasRef(node.name, type, args, node.loc);
};
const lowerTypeParam: Lower<Ast.CTParamRef, Ast.LTParamRef> =
function* (node) {
    return Ast.LTParamRef(node.name, node.loc);
};
const lowerTypeMap: Lower<Ast.CTMap, Ast.LTMap> =
function* (node) {
    const key = yield* lowerType(node.key);
    const value = yield* lowerType(node.value);
    return key && value && Ast.LTMap(key, value, node.loc);
};
const lowerTypeBounced: Lower<Ast.CTBounced, Ast.LTBounced> =
function* (node) {
    return Ast.LTBounced(node.name, node.loc);
};
const lowerTypeMaybe: Lower<Ast.CTMaybe, Ast.LTMaybe> =
function* (node) {
    const type = yield* lowerType(node.type);
    return type && Ast.LTMaybe(type, node.loc);
};
const lowerTypeTuple: Lower<Ast.CTTuple, Ast.LTTuple> =
function* (node) {
    const args = yield* lowerTypes(node.typeArgs);
    return args && Ast.LTTuple(args, node.loc);
};
const lowerTypeTensor: Lower<Ast.CTTensor, Ast.LTTensor> =
function* (node) {
    const args = yield* lowerTypes(node.typeArgs);
    return args && Ast.LTTensor(args, node.loc);
};
const lowerTypeBasic: Lower<Ast.CTBasic, Ast.LTBasic> =
function* (node) {
    return Ast.LTBasic(node.type, node.loc);
};