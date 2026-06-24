struct Primitives {
    i: Int;
    b: Bool;
    a: Address?;
    s: String;
    c: Cell?;
    sl: Slice?;
}

contract TestContract {
    data: Primitives = Primitives{
        i: 123,
        b: false,
        a: null,
        s: "hello",
        c: null,
        sl: null
    };
}