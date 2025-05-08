/// Snippet 12: Testing the DEPTH instruction in an asm function
asm fun getDepth(): Int { DEPTH }

fun main() {
    let d = getDepth();
}
