struct NestedOptional {
    foo: Int?;
    bar: SomeStruct?;
}

struct SomeStruct {
    baz: Int;
    flag: Bool;
}

contract TestContract {
    data: NestedOptional?;
    init() {
        self.data = null;
    }
}