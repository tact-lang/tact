fun testBase64Ok(): Slice {
    let s: String = "SGVyZSdzIEpvaG5ueSE=";
    return s.fromBase64();
}

contract MyTest {
    receive() {
        testBase64Ok();
    }
}
