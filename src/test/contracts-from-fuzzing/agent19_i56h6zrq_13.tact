struct AB { a: Int; b: Int }
struct Nested { ab: AB; c: Int }

// Test 14: Assembly function with structured parameter flattening
// The flattened stack order: ab.a, ab.b, then c
// The function adds the top two values (ab.b + c) then adds ab.a
asm fun addNested(n: Nested): Int { ADD ADD }

// Test 15: Assembly function with argument arrangement on parameters
// Changing the order: 'c' will be pushed first and 'self' later
struct Builder2 { dummy: Int }
asm(c self) extends fun asmStoreDict2(self: Builder2, c: Cell?): Builder2 { STDICT }

// Test 16: Basic inline arithmetic computation using TVM instructions
asm fun compute(): Int { 1 2 ADD }

// Test 18: Assembly function that returns the current TVM stack depth
asm fun depthOfStack(): Int { DEPTH }

// A showcase function to use these asm functions (if needed)
fun showcase() {
    let x = compute();
    let d = depthOfStack();
    // Using a dummy value to test addNested
    let n: Nested = Nested { ab: AB { a: 3, b: 4 }, c: 5 };
    let s = addNested(n); // expected: 3 + (4+5) = 12
}
