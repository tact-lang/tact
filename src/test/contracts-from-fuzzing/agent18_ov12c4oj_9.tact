// Test 5: Assembly function with a primitive not consumed by any TVM instruction
// This is expected to fail because primitives must be consumed by an instruction immediately following.
asm fun badPrimitve(): Int { 43 }

fun main() {
    let x = badPrimitve();
}
