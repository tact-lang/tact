fun testOptionalUnwrapNonNull(): Int {
    let a: Int? = 100;
    return a!!;
}

contract TestOptionalUnwrapNonNull {
    receive() {
        testOptionalUnwrapNonNull();
    }
}
