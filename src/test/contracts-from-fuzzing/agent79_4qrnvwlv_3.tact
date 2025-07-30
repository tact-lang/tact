struct S {
    v: Int;
}

contract Test2 {
    // Note the correct struct initialization using the constructor-like syntax
    s: S = S{ v: 42 };

    receive() {}

    // Getter returning a struct S
    get fun getS(): S {
        return self.s;
    }
}
