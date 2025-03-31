fun test_fromBase64(): String {
    let s: String = "SGVyZSdzIEpvaG5ueSE=";
    let fizz: Slice = s.asSlice().fromBase64();
    return fizz.asString();
}

contract TestContract {
    receive() {
        test_fromBase64();
    }
}
