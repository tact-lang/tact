struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    receive() {
        // Instantiate nested structs and dump a field from the inner struct
        let o = Outer{
            inner: Inner{
                a: 42,
            },
        };
        dump(o.inner.a);
    }
}
