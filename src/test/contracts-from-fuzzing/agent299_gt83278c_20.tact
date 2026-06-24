struct Variety {
    x: Int as uint16;
    y: Int as int8;
    flag1: Bool = true;
    flag2: Bool = false;
    note: String = "init";
    optionalNum: Int? = null;
    optionalFlag: Bool? = true;
    text: String?;
    z: Int;
}

contract TestContract {
    record: Variety;

    init() {
        self.record = Variety{
            x: 100,
            y: -50,
            flag1: false,
            flag2: true,
            note: "change",
            optionalNum: 123,
            optionalFlag: null,
            text: "hello",
            z: 999
        };
    }
}