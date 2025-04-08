struct NestedOptStruct {
    inner: S?;
}

struct S {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{
            inner: null
        };
    }
}