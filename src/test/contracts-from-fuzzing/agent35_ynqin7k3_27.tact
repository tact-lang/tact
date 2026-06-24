struct X {
    val: Int;
}

struct Y {
    val: X?;
}

contract OptionStructInner {
    y: Y;

    init() {
        self.y = Y{val: null};
    }
}