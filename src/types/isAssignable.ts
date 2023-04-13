import { TypeRef } from "./types";

export function isAssignable(src: TypeRef, to: TypeRef): boolean {

    // If both are refs
    if (src.kind === 'ref' && to.kind === 'ref') {

        // Can assign optional to non-optional
        if (!to.optional && src.optional) {
            return false;
        }

        // Check types
        return src.name === to.name;
    }

    // If both are maps
    if (src.kind === 'map' && to.kind === 'map') {
        return (src.key === to.key && src.value === to.value);
    }

    if (src.kind === 'bounced' || to.kind === 'bounced') {
        throw Error("Unimplemented");
    }

    // Allow assigning null to map
    if (src.kind === 'null' && to.kind === 'map') {
        return true;
    }

    // If either is void
    if (src.kind === 'void' || to.kind === 'void') {
        return false; // Void is not assignable
    }

    // Check null
    if (src.kind === 'null' && to.kind === 'ref') {
        return to.optional;
    }
    if (src.kind === 'null' && to.kind === 'null') {
        return true;
    }

    // All other options are not assignable
    return false;
}