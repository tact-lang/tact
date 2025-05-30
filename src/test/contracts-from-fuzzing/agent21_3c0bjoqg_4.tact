struct NestedOptional {
    optStruct: Inner?;
}

struct Inner {
    field: Int;
}

contract TestContract {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{
            optStruct: null
        };
    }
}