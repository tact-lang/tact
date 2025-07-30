struct S {
    foo: Int;
    bar: Bool;
    addr: Address;
    data: Cell;
    sliceVal: Slice;
    str: String;
    optInt: Int?;
    optBool: Bool?;
}

contract C {
    s: S = S{
        foo: 1,
        bar: true,
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        data: cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
        sliceVal: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
        str: "hello",
        optInt: null,
        optBool: null,
    };

    init() {
        self.s = S{
            foo: 2,
            bar: false,
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            data: cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
            sliceVal: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
            str: "world",
            optInt: 42,
            optBool: true,
        };
    }
}