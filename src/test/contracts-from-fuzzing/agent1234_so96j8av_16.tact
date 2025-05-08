struct Strange {
    s: String;
    n: Int;
}

contract StringStructTest {
    data: Strange;

    init() {
        self.data = Strange{
            s: "hello",
            n: 123,
        };
    }
}