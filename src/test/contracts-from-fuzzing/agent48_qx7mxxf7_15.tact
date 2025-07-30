struct Compose {
    num: Int;
    txt: String;
    flg: Bool;
}

contract MixedFields {
    field1: Int = 42;
    field2: Compose;

    init() {
        self.field2 = Compose{
            num: 1,
            txt: "hello",
            flg: true
        };
    }
}
