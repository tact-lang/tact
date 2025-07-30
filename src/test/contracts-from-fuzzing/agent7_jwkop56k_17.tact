/* Test: asm function using DUP and ADD instructions to verify stack manipulation.
   The function pushes 10, duplicates it, and then adds the two values, expecting 20.
*/

asm fun dupTest(): Int {
    10 PUSHINT
    DUP
    ADD
}

fun main() : Int {
    return dupTest();
}
