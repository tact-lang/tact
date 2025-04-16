struct Nested {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    d: Int;
    e: String;
    f: Bool?;
}

contract Test {
    val: Nested = Nested{
        a: 1,
        b: true,
        c: Inner{
            d: 5,
            e: "hello",
            f: null,
        }
    };
    
    receive() {
        // dummy receiver
    }
}