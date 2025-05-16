struct Inner {
    flag: Bool;
    txt: String;
}

contract NestedStructTest {
    data: Inner;

    init() {
        self.data = Inner{
            flag: true,
            txt: "test",
        };
    }
}