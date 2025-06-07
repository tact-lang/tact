// Comprehensive summary of current fuzz testing outcomes for asm functions feature

// 1. Basic asm function returning a constant
asm fun answer(): Int { 42 PUSHINT }

// 2. TVM instruction case sensitivity test
asm fun wrongCase(): Cell { mycode }

// 3. Primitive without consuming instruction test
asm fun primitiveAlone(): Int { 43 }

// 4. Parameter usage in asm function (referencing parameter directly)
asm fun identity(x: Int): Int { x }

// 5. Testing argument arrangement from docs
asm(c self) extends fun asmStoreDict(self: Builder, c: Cell?): Builder { STDICT }

// 6. Testing proper return arrangement swap with struct Pair (via struct Pair -> Pair { a, b })
struct Pair { a: Int; b: Int }
asm(-> 1 0) fun swapReturn(): Pair { 5 PUSHINT 10 PUSHINT }

// 7. Testing improper stack drop causing potential underflow
asm fun dropTooMany(): Int { DROP DROP }

// 8. Testing "mutates" attribute with type mismatch
asm(-> 1 0) extends mutates fun loadRefMismatch(self: Slice): Int { LDREF }

// 9. Testing nested struct parameter flattening
struct AB { a: Int; b: Int }
asm fun sumAB(two: AB): Int { ADD }

// 10. Testing multiple TVM instructions in sequence
asm fun multiStep(): Int { 5 PUSHINT 3 PUSHINT ADD }

// 11. Testing arrangement with not enough values (should fail)
// asm(-> 1 0) fun missingReturn(): Int { PUSHINT }

// 12. Testing inline attribute in asm function
asm inline fun inlineTest(): Int { 7 PUSHINT }

// 13. Testing proper use of literal encoding
asm fun push42(): Int { 42 PUSHINT }

// 14. Testing additional assembly snippets for additional scenarios
// 16. Testing proper order of TVM instructions with arrangements for loading int
struct SliceInt { s: Slice; val: Int }
asm(s len -> 1 0) fun asmLoadInt(len: Int, s: Slice): SliceInt { LDIX }

// 17. Testing stack underflow by excessive DROP in multiple-step operation
asm fun excessiveDrop(): Int { DROP DROP DROP }

// 18. Testing TVM instruction argument encoding near lower boundary
asm fun pushNeg5(): Int { -5 PUSHINT }

// 19. Testing TVM instruction argument encoding for value just outside small immediate range
asm fun push15(): Int { 15 PUSHINT }

// 20. Testing complex usage: multiple pushes, adds and a drop
asm fun complexStackOp(): Int {
    10 PUSHINT
    10 PUSHINT
    ADD
    20 PUSHINT
    ADD
    DROP
}

// 21. Testing improper inline usage with arrangement
asm inline fun inlineWithArrangement(): Int { 100 PUSHINT }

// 22. Testing concatenation of TVM instructions with extra spaces
asm fun spacedInstructions(): Int {  1 PUSHINT    2 PUSHINT   ADD   }

// 23. Testing retrieval of TVM stack depth and then dropping a value
asm fun checkDepth(): Int { DEPTH DROP }

// 24. Testing a minimal valid asm function using a literal 0
asm fun minimalValid(): Int { 0 PUSHINT }
