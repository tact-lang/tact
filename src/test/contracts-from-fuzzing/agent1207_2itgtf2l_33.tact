struct Wrap {
    a: Int;
    b: Int?;
}

contract WrapNull {
    val: Wrap?;

    init() {
        self.val = null;
    }
}