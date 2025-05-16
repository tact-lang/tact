asm fun push42(): Int {
    42 PUSHINT
}

fun main() {
    // calling push42 to ensure it works properly
    let res = push42();
}
