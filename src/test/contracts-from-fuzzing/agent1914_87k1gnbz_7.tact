struct NestedOptional {
    inner: OptionalStruct?;
}

struct OptionalStruct {
    val: Int?;
}

contract TestContract {
    no: NestedOptional;

    init() {
        self.no = NestedOptional{ inner: OptionalStruct{ val: null } };
    }
}