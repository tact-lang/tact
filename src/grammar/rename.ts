import {
    AstConstantDef,
    AstModuleItem,
    AstStatement,
    AstModule,
    AstTraitDeclaration,
    AstContractDeclaration,
    AstExpression,
    AstStructFieldInitializer,
    AstCondition,
    AstFunctionDef,
    AstContract,
    AstTrait,
    AstId,
    AstFunctionDecl,
    AstConstantDecl,
    AstNode,
} from "./ast";
import { dummySrcInfo } from "./grammar";
import { AstSorter } from "./sort";
import { AstHasher, AstHash } from "./hash";

type GivenName = string;

function id(text: string): AstId {
    return { kind: "id", text, id: 0, loc: dummySrcInfo };
}

/**
 * An utility class that provides alpha-renaming and topological sort functionality
 * for the AST comparison.
 */
export class AstRenamer {
    private constructor(
        private sort: boolean,
        private currentIdx: number = 0,
        private renamed: Map<AstHash, GivenName> = new Map(),
        private givenNames: Map<string, GivenName> = new Map(),
    ) {}
    public static make(params: Partial<{ sort: boolean }> = {}): AstRenamer {
        const { sort = true } = params;
        return new AstRenamer(sort);
    }

    /**
     * Renames the given node based on its AST.
     */
    public renameModule(module: AstModule): AstNode {
        return {
            ...module,
            items: this.renameModuleItems(module.items),
        };
    }

    private nextIdx(): number {
        const value = this.currentIdx;
        this.currentIdx += 1;
        return value;
    }

    /**
     * Generates a new unique node name.
     */
    private generateName(node: AstNode): GivenName {
        return `${node.kind}_${this.nextIdx()}`;
    }

    /**
     * Tries to get an identifier based on the node definition.
     */
    private getName(node: AstNode): string | undefined {
        switch (node.kind) {
            case "id":
            case "func_id":
                return node.text;
            case "primitive_type_decl":
            case "native_function_decl":
            case "struct_decl":
            case "message_decl":
            case "constant_def":
            case "constant_decl":
            case "function_def":
            case "function_decl":
            case "trait":
            case "contract":
                return node.name.text;
            default:
                return undefined;
        }
    }

    /**
     * Sets new or an existent name based on node's hash.
     */
    private setName(node: AstNode, forceName?: string): GivenName {
        const hash = AstHasher.make({ sort: this.sort }).hash(node);
        const giveNewName = (newName: string) => {
            const name = this.getName(node);
            if (name !== undefined) {
                this.givenNames.set(name, newName);
            }
        };
        const existentName = this.renamed.get(hash);
        if (existentName !== undefined) {
            giveNewName(existentName);
            return existentName;
        }
        const name = forceName ?? this.generateName(node);
        this.renamed.set(hash, name);
        giveNewName(name);
        return name;
    }

    public renameModuleItems(items: AstModuleItem[]): AstModuleItem[] {
        // Give new names to module-level elements.
        let renamedItems = items.map((item) => this.changeItemName(item));

        if (this.sort) {
            renamedItems.map((item) => this.sortAttributes(item));
        }

        // Apply renaming to the contents of these elements.
        renamedItems = renamedItems.map((item) =>
            this.renameModuleItemContents(item),
        );

        return this.sort ? this.sortModuleItems(renamedItems) : renamedItems;
    }

    /**
     * Lexicographically sort items based on their kinds and then by their names.
     */
    private sortModuleItems(items: AstModuleItem[]): AstModuleItem[] {
        const kindOrder = {
            primitive_type_decl: 1,
            native_function_decl: 2,
            struct_decl: 3,
            message_decl: 4,
            constant_def: 5,
            function_def: 6,
            asm_function_def: 7,
            trait: 8,
            contract: 9,
        };
        return items.sort((a, b) => {
            const kindComparison = kindOrder[a.kind] - kindOrder[b.kind];
            if (kindComparison !== 0) {
                return kindComparison;
            }
            return a.name.text.localeCompare(b.name.text);
        });
    }

    /**
     * Changes the name of a top-level/contract/trait element without inspecting its body.
     */
    private changeItemName<
        T extends AstModuleItem | AstConstantDecl | AstFunctionDecl,
    >(item: T): T {
        switch (item.kind) {
            case "primitive_type_decl":
                return item; // Skip renaming
            case "native_function_decl": {
                const newName = this.setName(
                    item,
                    `native_${item.nativeName.text}`,
                );
                return { ...item, name: id(newName) };
            }
            case "contract": {
                const newName = this.setName(item);
                const declarations = item.declarations.map((decl) => {
                    if (
                        decl.kind === "function_def" ||
                        decl.kind === "constant_def"
                    ) {
                        return this.changeItemName(
                            decl,
                        ) as AstContractDeclaration;
                    } else {
                        return decl;
                    }
                });
                return { ...item, name: id(newName), declarations };
            }
            case "trait": {
                const newName = this.setName(item);
                const declarations = item.declarations.map((decl) => {
                    if (
                        decl.kind === "function_def" ||
                        decl.kind === "constant_def" ||
                        decl.kind === "function_decl" ||
                        decl.kind === "constant_decl"
                    ) {
                        return this.changeItemName(decl) as AstTraitDeclaration;
                    } else {
                        return decl;
                    }
                });
                return { ...item, name: id(newName), declarations };
            }
            default: {
                const newName = this.setName(item);
                return { ...item, name: id(newName) };
            }
        }
    }

    /**
     * Renames the contents of an AstModuleItem based on its kind.
     */
    private renameModuleItemContents(item: AstModuleItem): AstModuleItem {
        switch (item.kind) {
            case "struct_decl":
            case "message_decl":
                return item;
            case "function_def":
                return this.renameFunctionContents(item as AstFunctionDef);
            case "constant_def":
                return this.renameConstantContents(item as AstConstantDef);
            case "trait":
                return this.renameTraitContents(item as AstTrait);
            case "contract":
                return this.renameContractContents(item as AstContract);
            default:
                return item; // No further renaming needed for other kinds
        }
    }

    /**
     * Sorts attributes within an item if available.
     */
    private sortAttributes<
        T extends AstModuleItem | AstContractDeclaration | AstTraitDeclaration,
    >(item: T): T {
        switch (item.kind) {
            case "trait":
            case "contract":
                return {
                    ...item,
                    attributes: AstSorter.sortAttributes(item.attributes),
                    declarations: item.declarations.map((decl) =>
                        this.sortAttributes(decl),
                    ),
                };
            case "constant_decl":
            case "constant_def":
                return {
                    ...item,
                    attributes: AstSorter.sortAttributes(item.attributes),
                };
            case "function_decl":
            case "function_def":
                return {
                    ...item,
                    attributes: AstSorter.sortAttributes(item.attributes),
                };
            default:
                return item;
        }
    }

    /**
     * Renames the contents of a function.
     */
    private renameFunctionContents(
        functionDef: AstFunctionDef,
    ): AstFunctionDef {
        const statements = this.renameStatements(functionDef.statements);
        return { ...functionDef, statements };
    }

    /**
     * Renames the contents of a constant, focusing on the initializer.
     */
    private renameConstantContents(
        constantDef: AstConstantDef,
    ): AstConstantDef {
        const initializer = this.renameExpression(constantDef.initializer);
        return { ...constantDef, initializer };
    }

    /**
     * Renames the contents of a trait, including its declarations.
     */
    private renameTraitContents(trait: AstTrait): AstTrait {
        const declarations = trait.declarations.map((decl) => {
            if (decl.kind === "function_def") {
                return this.renameFunctionContents(decl as AstFunctionDef);
            } else if (decl.kind === "constant_def") {
                return this.renameConstantContents(decl as AstConstantDef);
            } else {
                return decl;
            }
        });
        return { ...trait, declarations };
    }

    /**
     * Renames the contents of a contract, including its declarations and parameters.
     */
    private renameContractContents(contract: AstContract): AstContract {
        const declarations = contract.declarations.map((decl) => {
            if (decl.kind === "function_def") {
                return this.renameFunctionContents(decl as AstFunctionDef);
            } else if (decl.kind === "constant_def") {
                return this.renameConstantContents(decl as AstConstantDef);
            } else {
                return decl;
            }
        });
        return { ...contract, declarations };
    }

    private renameStatements(statements: AstStatement[]): AstStatement[] {
        return statements.map((stmt) => {
            return this.renameStatement(stmt);
        });
    }

    private renameStatement(stmt: AstStatement): AstStatement {
        switch (stmt.kind) {
            case "statement_let":
                return {
                    ...stmt,
                    expression: this.renameExpression(stmt.expression),
                };
            case "statement_return":
                return {
                    ...stmt,
                    expression: stmt.expression
                        ? this.renameExpression(stmt.expression)
                        : null,
                };
            case "statement_expression":
                return {
                    ...stmt,
                    expression: this.renameExpression(stmt.expression),
                };
            case "statement_assign":
                return {
                    ...stmt,
                    path: this.renameExpression(stmt.path),
                    expression: this.renameExpression(stmt.expression),
                };
            case "statement_augmentedassign":
                return {
                    ...stmt,
                    path: this.renameExpression(stmt.path),
                    expression: this.renameExpression(stmt.expression),
                };
            case "statement_condition":
                return {
                    ...stmt,
                    condition: this.renameExpression(stmt.condition),
                    trueStatements: this.renameStatements(stmt.trueStatements),
                    falseStatements: stmt.falseStatements
                        ? this.renameStatements(stmt.falseStatements)
                        : null,
                    elseif: stmt.elseif
                        ? (this.renameStatement(stmt.elseif) as AstCondition)
                        : null,
                };
            case "statement_while":
            case "statement_until":
                return {
                    ...stmt,
                    condition: this.renameExpression(stmt.condition),
                    statements: this.renameStatements(stmt.statements),
                };
            case "statement_repeat":
                return {
                    ...stmt,
                    iterations: this.renameExpression(stmt.iterations),
                    statements: this.renameStatements(stmt.statements),
                };
            case "statement_try":
                return {
                    ...stmt,
                    statements: this.renameStatements(stmt.statements),
                };
            case "statement_try_catch":
                return {
                    ...stmt,
                    statements: this.renameStatements(stmt.statements),
                    catchStatements: this.renameStatements(
                        stmt.catchStatements,
                    ),
                };
            case "statement_foreach":
                return {
                    ...stmt,
                    map: this.renameExpression(stmt.map),
                    statements: this.renameStatements(stmt.statements),
                };
            default:
                return stmt;
        }
    }

    private renameExpression(expr: AstExpression): AstExpression {
        switch (expr.kind) {
            case "id":
                return {
                    ...expr,
                    text: this.renamed.get(expr.text) ?? expr.text,
                };
            case "op_binary":
                return {
                    ...expr,
                    left: this.renameExpression(expr.left),
                    right: this.renameExpression(expr.right),
                };
            case "op_unary":
                return {
                    ...expr,
                    operand: this.renameExpression(expr.operand),
                };
            case "field_access":
                return {
                    ...expr,
                    aggregate: this.renameExpression(expr.aggregate),
                };
            case "method_call":
            case "static_call":
                return {
                    ...expr,
                    args: expr.args.map((arg) => this.renameExpression(arg)),
                };
            case "struct_instance":
                return {
                    ...expr,
                    args: expr.args.map((arg) =>
                        this.renameStructFieldInitializer(arg),
                    ),
                };
            case "init_of":
                return {
                    ...expr,
                    args: expr.args.map((arg) => this.renameExpression(arg)),
                };
            case "conditional":
                return {
                    ...expr,
                    condition: this.renameExpression(expr.condition),
                    thenBranch: this.renameExpression(expr.thenBranch),
                    elseBranch: this.renameExpression(expr.elseBranch),
                };
            case "number":
            case "boolean":
            case "string":
            case "null":
                return expr;
            default:
                return expr;
        }
    }

    private renameStructFieldInitializer(
        initializer: AstStructFieldInitializer,
    ): AstStructFieldInitializer {
        return {
            ...initializer,
            initializer: this.renameExpression(initializer.initializer),
        };
    }
}
