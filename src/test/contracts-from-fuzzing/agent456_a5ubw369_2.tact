struct Inner {
    x: Int;
    y: Int;
    z: Int;
}

contract LargeStructTest {
    bigField: Inner;

    init() {
        self.bigField = Inner{
            x: 1,
            y: 2,
            z: 3
        };
    }
}