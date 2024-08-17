import {
    AstPrimitiveTypeDecl,
    AstFunctionAttribute,
    AstConstantAttribute,
    AstContractAttribute,
    AstNode,
} from "./ast";
import { throwInternalCompilerError } from "../errors";

/**
 * Provides utilities to sort lists of AST nodes.
 */
// eslint-disable-next-line @typescript-eslint/no-extraneous-class
export class AstSorter {
    public static sort<T extends AstNode>(items: T[]): T[] {
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

    private static sortPrimitiveTypeDecls(
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

    public static sortAttributes<
        T extends
            | AstConstantAttribute
            | AstContractAttribute
            | AstFunctionAttribute,
    >(attributes: T[]): T[] {
        return attributes.sort((a, b) => a.type.localeCompare(b.type));
    }
}
