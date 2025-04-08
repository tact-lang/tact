struct Inner {
    x: Int;
    y: Int?;
    flag: Bool;
}

contract NestedStructTest {
    point: Inner;

    init() {
        self.point = Inner{
            x: 10,
            y: null,
            flag: true
        };
    }
}