struct OptionalNested {
    val: Int?;
    optStruct: NestedStruct?;
}

struct NestedStruct {
    str: String;
    flag: Bool;
}

contract TestContract {
    optNest: OptionalNested;

    init() {
        self.optNest = OptionalNested{val: null, optStruct: null};
    }
}