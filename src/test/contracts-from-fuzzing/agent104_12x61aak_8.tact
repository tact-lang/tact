fun testSliceEquality(): Bool {
    let s: String = "Sample text for slicing";
    return s.asSlice().asString() == s;
}

contract TestContract {
    receive() {
        let isEqual: Bool = testSliceEquality();
    }
}
