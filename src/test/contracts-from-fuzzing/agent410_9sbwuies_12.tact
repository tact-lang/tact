struct Info {
    x: Int as uint8;
    flag: Bool;
}

contract TestContract {
    number: Int as uint32;
    data: Info;
    label: String;

    init() {
        self.number = 123;
        self.data = Info{ x: 7, flag: true };
        self.label = "test";
    }
}
