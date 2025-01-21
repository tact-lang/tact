import * as A from "./ast";
import { throwInternalCompilerError } from "@/error/errors";

/**
 * Provides utilities to sort lists of AST nodes.
 */
// eslint-disable-next-line @typescript-eslint/no-extraneous-class
export class AstSorter {
    public static sort<T extends A.AstNode>(items: T[]): T[] {
        if (items.length === 0) {
            return items;
        }
        const kind = items[0]!.kind;
        switch (kind) {
            case "primitive_type_decl":
                return this.sortPrimitiveTypeDecls(
                    items as A.AstPrimitiveTypeDecl[],
                ) as T[];
            default:
                throwInternalCompilerError(`Unsupported node kind: ${kind}`);
        }
    }

    private static sortPrimitiveTypeDecls(
        decls: A.AstPrimitiveTypeDecl[],
    ): A.AstPrimitiveTypeDecl[] {
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

    public static sortAttributes<
        T extends
            | A.AstConstantAttribute
            | A.AstContractAttribute
            | A.AstFunctionAttribute,
    >(attributes: T[]): T[] {
        return attributes.sort((a, b) => a.type.localeCompare(b.type));
    }
}
