struct NestedOpt2 {
    a: Int?;
    b: String?;
}

struct Container {
    first: NestedOpt2;
    second: NestedOpt2;
}

contract OptStructs {
    cont: Container = Container{
        first: NestedOpt2{ a: null, b: null },
        second: NestedOpt2{ a: null, b: null }
    };
}
