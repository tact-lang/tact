struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test7 {
    receive () {}

    // Getter function returning a nested composite struct
    get fun getNested(): Outer {
        return Outer{ inner: Inner{ a: 42 } };
    }
}
