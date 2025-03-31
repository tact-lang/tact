struct S {
    a: Int;
}

contract Test2 {
    receive() {}

    // Getter returning a struct instance using proper instantiation syntax
    get fun getStruct(): S {
        return S{ a: 100 };
    }
}
