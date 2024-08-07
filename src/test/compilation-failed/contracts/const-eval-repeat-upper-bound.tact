fun funcTest(): Int {
    // (2 ** 31 - 1)
    let i = 2147483647;
    repeat (i + 1) {  // Causes a repeat bound error
        // do nothing
    }
    return i;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return funcTest();
    }
}
