fun testSliceAsString(): Bool {
    let s: String = "TestString";
    let s2: String = s.asSlice().asString();
    return s == s2;
}

contract TestContract {
    receive() {
        let res = testSliceAsString();
    }
}
