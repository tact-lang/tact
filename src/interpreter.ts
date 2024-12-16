import { evalConstantExpression } from "./constEval";
import { CompilerContext } from "./context";
import {
    TactConstEvalError,
    TactParseError,
    throwInternalCompilerError,
} from "./errors";
import {
    AstAsmFunctionDef,
    AstBoolean,
    AstCondition,
    AstConditional,
    AstConstantDef,
    AstContract,
    AstExpression,
    AstFieldAccess,
    AstFunctionDef,
    AstId,
    AstInitOf,
    AstMessageDecl,
    AstMethodCall,
    AstModuleItem,
    AstNativeFunctionDecl,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstOpUnary,
    AstPrimitiveTypeDecl,
    AstStatement,
    AstStatementAssign,
    AstStatementAugmentedAssign,
    AstStatementDestruct,
    AstStatementExpression,
    AstStatementForEach,
    AstStatementLet,
    AstStatementRepeat,
    AstStatementReturn,
    AstStatementTry,
    AstStatementTryCatch,
    AstStatementUntil,
    AstStatementWhile,
    AstStaticCall,
    AstString,
    AstStructDecl,
    AstStructInstance,
    AstTrait,
} from "./grammar/ast";
import { parseExpression } from "./grammar/grammar";
import { Value } from "./types/types";

type EvalResult =
    | { kind: "ok"; value: Value }
    | { kind: "error"; message: string };

export function parseAndEvalExpression(sourceCode: string): EvalResult {
    try {
        const ast = parseExpression(sourceCode);
        const constEvalResult = evalConstantExpression(
            ast,
            new CompilerContext(),
        );
        return { kind: "ok", value: constEvalResult };
    } catch (error) {
        if (
            error instanceof TactParseError ||
            error instanceof TactConstEvalError
        )
            return { kind: "error", message: error.message };
        throw error;
    }
}

export abstract class InterpreterInterface<T> {
    public interpretModuleItem(ast: AstModuleItem) {
        switch (ast.kind) {
            case "constant_def":
                this.interpretConstantDef(ast);
                break;
            case "function_def":
                this.interpretFunctionDef(ast);
                break;
            case "asm_function_def":
                this.interpretAsmFunctionDef(ast);
                break;
            case "struct_decl":
                this.interpretStructDecl(ast);
                break;
            case "message_decl":
                this.interpretMessageDecl(ast);
                break;
            case "native_function_decl":
                this.interpretNativeFunctionDecl(ast);
                break;
            case "primitive_type_decl":
                this.interpretPrimitiveTypeDecl(ast);
                break;
            case "contract":
                this.interpretContract(ast);
                break;
            case "trait":
                this.interpretTrait(ast);
                break;
            default:
                throwInternalCompilerError("Unrecognized module item kind");
        }
    }

    public abstract interpretConstantDef(ast: AstConstantDef): void;

    public abstract interpretFunctionDef(ast: AstFunctionDef): void;

    public abstract interpretAsmFunctionDef(ast: AstAsmFunctionDef): void;

    public abstract interpretStructDecl(ast: AstStructDecl): void;

    public abstract interpretMessageDecl(ast: AstMessageDecl): void;

    public abstract interpretPrimitiveTypeDecl(ast: AstPrimitiveTypeDecl): void;

    public abstract interpretNativeFunctionDecl(
        ast: AstNativeFunctionDecl,
    ): void;

    public abstract interpretContract(ast: AstContract): void;

    public abstract interpretTrait(ast: AstTrait): void;

    public interpretExpression(ast: AstExpression): T {
        switch (ast.kind) {
            case "id":
                return this.interpretName(ast);
            case "method_call":
                return this.interpretMethodCall(ast);
            case "init_of":
                return this.interpretInitOf(ast);
            case "null":
                return this.interpretNull(ast);
            case "boolean":
                return this.interpretBoolean(ast);
            case "number":
                return this.interpretNumber(ast);
            case "string":
                return this.interpretString(ast);
            case "op_unary":
                return this.interpretUnaryOp(ast);
            case "op_binary":
                return this.interpretBinaryOp(ast);
            case "conditional":
                return this.interpretConditional(ast);
            case "struct_instance":
                return this.interpretStructInstance(ast);
            case "field_access":
                return this.interpretFieldAccess(ast);
            case "static_call":
                return this.interpretStaticCall(ast);
            default:
                throwInternalCompilerError("Unrecognized expression kind");
        }
    }

    public abstract interpretName(ast: AstId): T;

    public abstract interpretMethodCall(ast: AstMethodCall): T;

    public abstract interpretInitOf(ast: AstInitOf): T;

    public abstract interpretNull(ast: AstNull): T;

    public abstract interpretBoolean(ast: AstBoolean): T;

    public abstract interpretNumber(ast: AstNumber): T;

    public abstract interpretString(ast: AstString): T;

    public abstract interpretUnaryOp(ast: AstOpUnary): T;

    public abstract interpretBinaryOp(ast: AstOpBinary): T;

    public abstract interpretConditional(ast: AstConditional): T;

    public abstract interpretStructInstance(ast: AstStructInstance): T;

    public abstract interpretFieldAccess(ast: AstFieldAccess): T;

    public abstract interpretStaticCall(ast: AstStaticCall): T;

    public interpretStatement(ast: AstStatement) {
        switch (ast.kind) {
            case "statement_let":
                this.interpretLetStatement(ast);
                break;
            case "statement_destruct":
                this.interpretDestructStatement(ast);
                break;
            case "statement_assign":
                this.interpretAssignStatement(ast);
                break;
            case "statement_augmentedassign":
                this.interpretAugmentedAssignStatement(ast);
                break;
            case "statement_condition":
                this.interpretConditionStatement(ast);
                break;
            case "statement_expression":
                this.interpretExpressionStatement(ast);
                break;
            case "statement_foreach":
                this.interpretForEachStatement(ast);
                break;
            case "statement_repeat":
                this.interpretRepeatStatement(ast);
                break;
            case "statement_return":
                this.interpretReturnStatement(ast);
                break;
            case "statement_try":
                this.interpretTryStatement(ast);
                break;
            case "statement_try_catch":
                this.interpretTryCatchStatement(ast);
                break;
            case "statement_until":
                this.interpretUntilStatement(ast);
                break;
            case "statement_while":
                this.interpretWhileStatement(ast);
                break;
            default:
                throwInternalCompilerError("Unrecognized statement kind");
        }
    }

    public abstract interpretLetStatement(ast: AstStatementLet): void;

    public abstract interpretDestructStatement(ast: AstStatementDestruct): void;

    public abstract interpretAssignStatement(ast: AstStatementAssign): void;

    public abstract interpretAugmentedAssignStatement(
        ast: AstStatementAugmentedAssign,
    ): void;

    public abstract interpretConditionStatement(ast: AstCondition): void;

    public abstract interpretExpressionStatement(
        ast: AstStatementExpression,
    ): void;

    public abstract interpretForEachStatement(ast: AstStatementForEach): void;

    public abstract interpretRepeatStatement(ast: AstStatementRepeat): void;

    public abstract interpretReturnStatement(ast: AstStatementReturn): void;

    public abstract interpretTryStatement(ast: AstStatementTry): void;

    public abstract interpretTryCatchStatement(ast: AstStatementTryCatch): void;

    public abstract interpretUntilStatement(ast: AstStatementUntil): void;

    public abstract interpretWhileStatement(ast: AstStatementWhile): void;

    protected executeStatements(statements: AstStatement[]) {
        statements.forEach((currStmt) => {
            this.interpretStatement(currStmt);
        }, this);
    }
}
