struct Data {
    text: String;
    flag: Bool?;
    num: Int;
}

contract Test {
    record: Data;

    init() {
        self.record = Data{
            text: "ok",
            flag: null,
            num: 7
        };
    }
}
