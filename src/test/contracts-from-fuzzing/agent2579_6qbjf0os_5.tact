struct OptionalsStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ManyOptionals {
    data: OptionalsStruct;
    init() {
        self.data = OptionalsStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}