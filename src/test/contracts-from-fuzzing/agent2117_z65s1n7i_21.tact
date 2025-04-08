struct A { x: Int as uint8; }

contract OutOfRangeTest {
    storage: A;
    init() {
        self.storage = A{ x: -1 };
    }
}