struct Foo {
    val: Int as uint256;
    txt: String;
}

contract Fuzz18 {
    data: Foo?;

    init() {
        self.data = null;
    }
}