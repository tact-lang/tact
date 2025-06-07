struct NestedOpt1 {
    foo: Int?;
}

struct NestedOpt2 {
    bar: NestedOpt1?;
}

struct NestedOpt3 {
    baz: NestedOpt2?;
}

struct NestedOpt4 {
    qux: NestedOpt3?;
}

contract TestContract {
    complex: NestedOpt4;

    init() {
        self.complex = NestedOpt4{
            qux: null
        };
    }
}