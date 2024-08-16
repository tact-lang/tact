import { AstPrimitiveTypeDecl, AstNode } from "./ast";
import { throwInternalCompilerError } from "../errors";

/**
 * Provides utilities to sort lists of AST nodes.
 */
export class AstSorter {
    private constructor() {}
    public static make(): AstSorter {
        return new AstSorter();
    }

    public sort<T extends AstNode>(items: T[]): T[] {
        if (items.length === 0) {
            return items;
        }
        const kind = items[0]!.kind;
        switch (kind) {
            case "primitive_type_decl":
                return this.sortPrimitiveTypeDecls(
                    items as AstPrimitiveTypeDecl[],
                ) as T[];
            default:
                throwInternalCompilerError(`Unsupported node kind: ${kind}`);
        }
    }

    private sortPrimitiveTypeDecls(
        decls: AstPrimitiveTypeDecl[],
    ): AstPrimitiveTypeDecl[] {
        return decls.sort((a, b) => {
            // Case-insensitive sorting
            const nameA = a.name.text.toLowerCase();
            const nameB = b.name.text.toLowerCase();
            if (nameA < nameB) {
                return -1;
            }
            if (nameA > nameB) {
                return 1;
            }
            return 0;
        });
    }
}
