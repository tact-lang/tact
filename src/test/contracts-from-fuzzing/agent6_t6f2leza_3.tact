/// Expecting COMPILATION ERROR: primitive without instruction
asm fun badPrimitive(): Int { 43 }

fun main() {
    let _ = badPrimitive();
}
