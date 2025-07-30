struct Inner {
    data: Int;
    flag: Bool?;
    note: String;
}

contract ComboTest {
    info: Inner;

    init() {
        self.info = Inner{
            data: 123,
            flag: null,
            note: "hello"
        };
    }

    receive() {}
}