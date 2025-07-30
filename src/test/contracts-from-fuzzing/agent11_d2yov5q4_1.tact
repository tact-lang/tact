struct InnerStruct {
    flag: Bool;
    value: Int;
}

contract TestContract {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{
            flag: true,
            value: 42,
        };
    }
}