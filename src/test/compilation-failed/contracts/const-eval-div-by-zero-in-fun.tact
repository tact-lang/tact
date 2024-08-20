fun functionTest(): Int {
    let result = 100;
    let i = 2;
    repeat(5) {
        i -= 1;
        result /= i;
    }
    return result;
}

contract ConstEvalNegativeTest {
    get fun something(): Int {
        return functionTest();
    }
}
