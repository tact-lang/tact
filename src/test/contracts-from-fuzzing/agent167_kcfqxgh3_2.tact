struct Param {
    amount: Int = 1234;
    note: String = "default";
    active: Bool = false;
    nested: InnerStruct;
}

struct InnerStruct {
    flag: Bool = true;
    value: Int = 5;
}

contract TestPersistent {
    stored: Param;

    init() {
        self.stored = Param{
            amount: 777,
            note: "custom",
            active: true,
            nested: InnerStruct{
                flag: false,
                value: 999
            }
        };
    }
}