struct X {
    val: Int as uint8;
}

contract TestSerialize {
    data: X;

    init() {
        self.data = X{ val: 255 };
    }
}