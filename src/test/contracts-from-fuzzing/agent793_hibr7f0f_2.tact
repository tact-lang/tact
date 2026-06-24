struct Inner {
    x: Int;
    y: Bool;
    flag: Bool?;
    name: String?;
}

contract NestedStructTest {
    data: Inner;

    init() {
        self.data = Inner{
            x: 10,
            y: false,
            flag: null,
            name: null,
        };
    }
}