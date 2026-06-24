// Test 7: Edge-case testing: mixing valid TVM instruction with extra spacing
asm fun spaceTest(): Int {
    42    PUSHINT
}

fun main() {
    let x = spaceTest();
}
