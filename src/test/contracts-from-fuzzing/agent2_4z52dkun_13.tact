/// Test 14: Nested structure flattening
struct A { a: Int; b: Int }
struct B { first: A; second: A }

// This function will sum all 4 integers from the nested struct.
// Initial stack (flattened): first.a, first.b, second.a, second.b
// We'll push 0 and then add each value in sequence.
asm fun sumNested(b: B): Int { 
    0 PUSHINT   // initialize accumulator
    // now flatten b: first.a, first.b, second.a, second.b are on the stack in that order (first.a at bottom)
    ADD         // add top two values
    ADD         // add next
    ADD         // add next
}
