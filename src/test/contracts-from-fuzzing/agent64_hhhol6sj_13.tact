fun testStringEquality(s: String): Int {
    if (s == "Hello") {
        return 1;
    } else {
        return 0;
    }
}

contract TestContract {
    receive() {
        let r = testStringEquality("Hello");
    }
}
