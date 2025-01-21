import * as A from "./ast";
import { AstSorter } from "./sort";
import { AstHasher, AstHash } from "./hash";
import { dummySrcInfo } from "../grammar/src-info";

type GivenName = string;

function id(text: string): A.AstId {
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
    public renameModule(module: A.AstModule): A.AstNode {
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
    private generateName(node: A.AstNode): GivenName {
        return `${node.kind}_${this.nextIdx()}`;
    }

    /**
     * Tries to get an identifier based on the node definition.
     */
    private getName(node: A.AstNode): string | undefined {
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
    private setName(node: A.AstNode, forceName?: string): GivenName {
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

    public renameModuleItems(items: A.AstModuleItem[]): A.AstModuleItem[] {
        // Give new names to module-level elements.
        const renamedItems = items.map((item) =>
            this.renameModuleItemContents(
                this.sort
                    ? this.sortAttributes(this.changeItemName(item))
                    : this.changeItemName(item),
            ),
        );
        return this.sort ? this.sortModuleItems(renamedItems) : renamedItems;
    }

    /**
     * Lexicographically sort items based on their kinds and then by their names.
     */
    private sortModuleItems(items: A.AstModuleItem[]): A.AstModuleItem[] {
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
        T extends A.AstModuleItem | A.AstConstantDecl | A.AstFunctionDecl,
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
                        ) as A.AstContractDeclaration;
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
                        return this.changeItemName(
                            decl,
                        ) as A.AstTraitDeclaration;
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
    private renameModuleItemContents(item: A.AstModuleItem): A.AstModuleItem {
        switch (item.kind) {
            case "struct_decl":
                return item;
            case "message_decl":
                if (item.opcode !== null) {
                    return {
                        ...item,
                        opcode: this.renameExpression(item.opcode),
                    };
                }
                return item;
            case "function_def":
                return this.renameFunctionContents(item as A.AstFunctionDef);
            case "constant_def":
                return this.renameConstantContents(item as A.AstConstantDef);
            case "trait":
                return this.renameTraitContents(item as A.AstTrait);
            case "contract":
                return this.renameContractContents(item as A.AstContract);
            default:
                return item; // No further renaming needed for other kinds
        }
    }

    /**
     * Sorts attributes within an item if available.
     */
    private sortAttributes<
        T extends
            | A.AstModuleItem
            | A.AstContractDeclaration
            | A.AstTraitDeclaration,
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
        functionDef: A.AstFunctionDef,
    ): A.AstFunctionDef {
        const attributes = this.renameFunctionAttributes(
            functionDef.attributes,
        );
        const statements = this.renameStatements(functionDef.statements);
        return { ...functionDef, attributes, statements };
    }

    /**
     * Renames getter's methodId expression.
     */
    private renameFunctionAttributes(
        functionAttrs: A.AstFunctionAttribute[],
    ): A.AstFunctionAttribute[] {
        return functionAttrs.map((attr) => {
            if (attr.type === "get" && attr.methodId !== null) {
                return {
                    ...attr,
                    methodId: this.renameExpression(attr.methodId),
                };
            } else {
                return attr;
            }
        });
    }

    /**
     * Renames the contents of a constant, focusing on the initializer.
     */
    private renameConstantContents(
        constantDef: A.AstConstantDef,
    ): A.AstConstantDef {
        const initializer = this.renameExpression(constantDef.initializer);
        return { ...constantDef, initializer };
    }

    /**
     * Renames the contents of a trait, including its declarations.
     */
    private renameTraitContents(trait: A.AstTrait): A.AstTrait {
        const declarations = trait.declarations.map((decl) => {
            if (decl.kind === "function_def") {
                return this.renameFunctionContents(decl as A.AstFunctionDef);
            } else if (decl.kind === "constant_def") {
                return this.renameConstantContents(decl as A.AstConstantDef);
            } else {
                return decl;
            }
        });
        return { ...trait, declarations };
    }

    /**
     * Renames the contents of a contract, including its declarations and parameters.
     */
    private renameContractContents(contract: A.AstContract): A.AstContract {
        const declarations = contract.declarations.map((decl) => {
            if (decl.kind === "function_def") {
                return this.renameFunctionContents(decl as A.AstFunctionDef);
            } else if (decl.kind === "constant_def") {
                return this.renameConstantContents(decl as A.AstConstantDef);
            } else {
                return decl;
            }
        });
        return { ...contract, declarations };
    }

    private renameStatements(statements: A.AstStatement[]): A.AstStatement[] {
        return statements.map((stmt) => {
            return this.renameStatement(stmt);
        });
    }

    private renameStatement(stmt: A.AstStatement): A.AstStatement {
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
                        ? (this.renameStatement(stmt.elseif) as A.AstCondition)
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
                    catchBlock: stmt.catchBlock
                        ? {
                              catchName: stmt.catchBlock.catchName,
                              catchStatements: this.renameStatements(
                                  stmt.catchBlock.catchStatements,
                              ),
                          }
                        : undefined,
                };
            case "statement_foreach":
                return {
                    ...stmt,
                    map: this.renameExpression(stmt.map),
                    statements: this.renameStatements(stmt.statements),
                };
            case "statement_destruct":
                return {
                    ...stmt,
                    expression: this.renameExpression(stmt.expression),
                };
            default:
                return stmt;
        }
    }

    private renameExpression(expr: A.AstExpression): A.AstExpression {
        switch (expr.kind) {
            case "id":
                return {
                    ...expr,
                    text: this.givenNames.get(expr.text) ?? expr.text,
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
        initializer: A.AstStructFieldInitializer,
    ): A.AstStructFieldInitializer {
        return {
            ...initializer,
            initializer: this.renameExpression(initializer.initializer),
        };
    }
}
