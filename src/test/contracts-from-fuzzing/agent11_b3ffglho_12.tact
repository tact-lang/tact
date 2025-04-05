struct Inner {
    a: Int as uint32;
    b: Int? as uint32;
}

struct Complex {
    flat1: Int as uint32;
    inner: Inner;
    m: map<Int,Int>;
}

contract Test {
    receive() {
        let s: Complex = Complex{
            flat1: 10,
            inner: Inner{
                a: 20,
                b: null
            },
            m: emptyMap()
        };
    }
}
