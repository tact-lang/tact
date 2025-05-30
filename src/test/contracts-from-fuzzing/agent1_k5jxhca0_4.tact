struct AB { a: Int; b: Int }

asm fun sumAB(two: AB): Int { 
    // The values are flattened: first a then b
    // ADD should add the two parameters.
    ADD
}