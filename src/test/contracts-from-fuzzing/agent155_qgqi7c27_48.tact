struct InnerPacked {
    a: Int as uint8;
    b: Int as uint4;
}

contract PackedContract {
    data: InnerPacked;
    init() {
        self.data = InnerPacked { a: 200, b: 7 };
    }
}