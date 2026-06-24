struct BoundedInt {
    small: Int as uint4;
    negative: Int as int6;
}

contract BoundedIntTest {
    val: BoundedInt;

    init() {
        self.val = BoundedInt{
            small: 15,
            negative: -32,
        };
    }
}