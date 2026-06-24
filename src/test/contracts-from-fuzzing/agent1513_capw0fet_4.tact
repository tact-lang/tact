struct OptionalNested {
    optStruct: InnerStruct?;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            optStruct: InnerStruct{
                value: 777,
                flag: true
            }
        };
    }
}