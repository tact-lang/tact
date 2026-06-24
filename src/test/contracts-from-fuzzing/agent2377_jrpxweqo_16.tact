struct NestedString {
    s: String;
}

struct ContainerStruct {
    n1: NestedString;
    n2: NestedString;
}

contract StructsWithStrings {
    c: ContainerStruct;

    init() {
        self.c = ContainerStruct{
            n1: NestedString{s:"foo"},
            n2: NestedString{s:"bar"},
        };
    }
}