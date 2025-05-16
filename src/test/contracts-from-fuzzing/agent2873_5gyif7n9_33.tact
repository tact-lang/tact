struct Wrap {
    inner: String;
}

contract WrapString {
    val: Wrap;
    init() {
        self.val = Wrap{inner:"hi"};
    }
}