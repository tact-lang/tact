// Summary test: A collection of assembly functions testing various edge cases of the asm functions feature

// Test A: Basic asm function that returns a constant
asm fun answer(): Int {
    42 PUSHINT
}

// Test B: Direct use of a parameter in the asm body (this will be interpreted as a TVM instruction name, not a reference to the parameter).
// Documentation cautions that parameters in asm functions are not directly accessible.
asm fun accessesParam(x: Int): Int { x }

// Test C: Assembly function with both argument and return arrangements, here swapping two integers in a Pair struct
struct Pair { first: Int; second: Int }
asm(s t -> 1 0) fun swap(s: Int, t: Int): Pair { SWAP }

// Test D: Assembly function with a return arrangement reversing three captured values
struct Triple { first: Int; second: Int; third: Int }
asm(-> 2 1 0) fun tripleReverse(a: Int, b: Int, c: Int): Triple { }

// Test E: Assembly function that uses a primitive with a consuming TVM instruction
asm fun goodPrimitive(): Int { 43 PUSHINT }

// Test F: Assembly function with nested struct parameter handling and custom TVM instructions
struct A { a: Int; b: Int }
struct Nested { inner: A; extra: Int }

// The TVM stack for parameter "n" (of type Nested) is flattened as inner.a, inner.b, extra
// The function swaps the top two elements then adds them, finally adding the bottom value
asm fun processNested(n: Nested): Int {
    SWAP      // Swap the top two: stack from [inner.a, inner.b, extra] to [inner.a, extra, inner.b]
    ADD       // Adds extra and inner.b, pushes their sum
    ADD       // Adds inner.a and the previous sum; final result = inner.a + inner.b + extra
}

// Main function calling all test cases
fun main() {
    // Test A
    let a: Int = answer();
    
    // Test B: although accessesParam does nothing useful, compiler picks 'x' as a TVM instruction, leaving parameter unused
    let b: Int = accessesParam(5);
    
    // Test C: Swap two integers
    let p: Pair = swap(100, 200);
    // Expected: p.first == 200, p.second == 100
    
    // Test D: Reverse the order of three numbers
    let t: Triple = tripleReverse(1, 2, 3);
    // Expected: t.first == 3, t.second == 2, t.third == 1
    
    // Test E
    let c: Int = goodPrimitive();
    
    // Test F: Process nested struct to compute sum
    let a_struct = A { a: 10, b: 20 };
    let n = Nested { inner: a_struct, extra: 30 };
    let sum: Int = processNested(n);
    // Expected sum: 10 + 20 + 30 = 60
}
