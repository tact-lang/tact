// Snippet 1: Valid asm extension function 'addOne'
// This function adds one to its receiver, and is called as an extension method
asm extends fun addOne(self: Int): Int { 1 PUSHINT ADD }

fun main() {
    41.addOne();
}
