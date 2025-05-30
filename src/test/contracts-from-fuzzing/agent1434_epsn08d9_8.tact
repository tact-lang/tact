struct WrappedOptional {
    a: Int?;
}

struct ContainingStruct {
    nested: WrappedOptional;
}

contract Test {
    s: ContainingStruct = ContainingStruct{
        nested: WrappedOptional{ a: null }
    };

    receive() {}
}