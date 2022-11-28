import { ASTArgument, ASTBuiltIn, ASTContract, ASTExpression, ASTField, ASTFunction, ASTNode, ASTStatement, ASTStruct } from "./ast";
import { CompilerContext } from "./context";

export type ContextVisitor = {
    visit(ctx: CompilerContext, node: ASTNode): void;
    visitEnd(ctx: CompilerContext, node: ASTNode): void;
}

function visitDefField(ctx: CompilerContext, visitor: ContextVisitor, s: ASTField): CompilerContext {
    visitor.visit(ctx, s);
    visitor.visitEnd(ctx, s);
    return ctx;
}

function visitArg(ctx: CompilerContext, visitor: ContextVisitor, s: ASTArgument): CompilerContext {
    visitor.visit(ctx, s);
    visitor.visitEnd(ctx, s);
    return ctx.addVariable({ name: s.name, node: s });
}

function visitExpression(ctx: CompilerContext, visitor: ContextVisitor, s: ASTExpression): CompilerContext {
    visitor.visit(ctx, s);
    if (s.kind === 'op_binary') {
        visitExpression(ctx, visitor, s.left);
        visitExpression(ctx, visitor, s.right);
    } else if (s.kind === 'op_unary') {
        visitExpression(ctx, visitor, s.right);
    } else if (s.kind === 'op_field') {
        visitExpression(ctx, visitor, s.src);
    }
    visitor.visitEnd(ctx, s);
    return ctx;
}

function visitStatement(ctx: CompilerContext, visitor: ContextVisitor, s: ASTStatement): CompilerContext {
    visitor.visit(ctx, s);
    if (s.kind === 'let') {

        // Visit right hand side
        visitExpression(ctx, visitor, s.expression);

        // Add variable to context (AFTER visiting expression to avoid cyclic references)
        ctx = ctx.addVariable({ name: s.name, node: s });
    } else if (s.kind === 'return') {
        // Nothing to do
    } else {
        throw Error('Unknown type');
    }
    visitor.visitEnd(ctx, s);
    return ctx;
}

function visitDefFunction(ctx: CompilerContext, visitor: ContextVisitor, s: ASTFunction): CompilerContext {
    visitor.visit(ctx, s);

    // Process all args
    for (let a of s.args) {
        ctx = visitArg(ctx, visitor, a);
    }

    // Process all statements
    for (let a of s.statements) {
        ctx = visitStatement(ctx, visitor, a);
    }

    visitor.visitEnd(ctx, s);
    return ctx;
}

function visitStruct(ctx: CompilerContext, visitor: ContextVisitor, s: ASTStruct): CompilerContext {
    visitor.visit(ctx, s);
    for (let f of s.fields) {
        ctx = visitDefField(ctx, visitor, f);
    }
    visitor.visitEnd(ctx, s);
    return ctx;
}

function visitContract(ctx: CompilerContext, visitor: ContextVisitor, s: ASTContract): CompilerContext {
    visitor.visit(ctx, s);

    // Add self to context
    ctx = ctx.addVariable({ name: 'self', node: s });

    // Process all declarations
    for (let d of s.declarations) {
        if (d.kind === 'def_field') {
            ctx = visitDefField(ctx, visitor, d);
        } else if (d.kind === 'def_function') {
            ctx = visitDefFunction(ctx, visitor, d);
        } else {
            throw Error('Unknown type');
        }
    }
    visitor.visitEnd(ctx, s);
    return ctx;
}

function visitBuiltIn(ctx: CompilerContext, visitor: ContextVisitor, s: ASTBuiltIn): CompilerContext {
    visitor.visit(ctx, s);
    visitor.visitEnd(ctx, s);
    return ctx;
}

export function visit(ctx: CompilerContext, visitor: ContextVisitor) {
    for (let n of Object.keys(ctx.astTypes)) {
        let t = ctx.astTypes[n];
        if (t.kind === 'def_struct') {
            ctx = visitStruct(ctx, visitor, t);
        } else if (t.kind === 'def_contract') {
            ctx = visitContract(ctx, visitor, t);
        } else if (t.kind === 'built-in') {
            ctx = visitBuiltIn(ctx, visitor, t);
        } else {
            throw Error('Unknown type');
        }
    }
}