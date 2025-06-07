struct OptionalStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    s: String;
    flag: Bool;
}

contract TestContract {
    value: OptionalStruct;

    init() {
        self.value = OptionalStruct{
            nested: InnerStruct{
                s: "abc",
                flag: true
            }
        };
    }
}