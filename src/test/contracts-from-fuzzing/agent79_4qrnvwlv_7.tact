struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
    opt: Int?;
}

contract Test5 {
    state: Outer = Outer{ inner: Inner{ a: 77 }, opt: null };

    receive() {}

    // Getter returning a nested struct with an optional field
    get fun getOuter(): Outer {
        return self.state;
    }
}
