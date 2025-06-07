// Test 1: Primitive Types Valid
// This test validates correct assignment and usage of primitive types: Int, Bool, and String.

contract TestPrimitiveValid {
    fun run() {
        let a: Int = 100;
        let b: Bool = true;
        let s: String = "Tact";
        // Expected: dump 150
        dump(a + 50);
    }
}
