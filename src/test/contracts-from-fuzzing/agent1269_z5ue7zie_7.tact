struct NestedOptional {
    x: Int?;
    y: Bool;
}

struct ContainingNestedOptional {
    inner: NestedOptional?;
    flag: Bool;
}

contract TestContract {
    testField: ContainingNestedOptional;

    init() {
        self.testField = ContainingNestedOptional{
            inner: null,
            flag: true
        };
    }
}