/* Test 8: Pushing a big integer constant to see opcode variation
   Expected to compile: the number 999 is outside the -5..10 range
*/

asm fun pushBig(): Int { 999 PUSHINT }

fun main() {
    let x = pushBig();
}
