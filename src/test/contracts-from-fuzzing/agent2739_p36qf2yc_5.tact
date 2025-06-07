struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct ContainsOptionalStruct {
    num: Int;
    opt: OptionalNested;
}

contract TestContract {
    value: ContainsOptionalStruct;
    init() {
        self.value = ContainsOptionalStruct{
            num: 5,
            opt: OptionalNested{
                x: null,
                y: false,
                z: null
            }
        };
    }
}