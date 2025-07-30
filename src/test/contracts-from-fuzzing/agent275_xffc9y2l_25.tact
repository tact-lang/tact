struct Container {
    small: Int as uint8;
    big: Int;
}

contract MixedSerialization {
    val: Container;

    init() {
        self.val = Container{ small: 7, big: 123456789 };
    }
}