// Test 2: Assembly function pushing a big integer (300) using PUSHINT
asm fun push_big(): Int {
    300 PUSHINT
}

fun main() {
    let v = push_big();
    // Just call the function; runtime behavior not observed at compile time
}
