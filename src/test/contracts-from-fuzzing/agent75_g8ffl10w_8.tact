fun test_optional(): Int {
    let x: Int? = null;
    let y: Int? = 42;
    if (x == null) {
        return 0;
    } else {
        return y!!; // non-null assertion
    }
}

contract TestOptional {
    receive() {
        test_optional();
    }
}
