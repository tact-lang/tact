asm fun push42(): Int { 42 PUSHINT }

fun main(): Int {
    let x: Int = push42();
    return x;
}
