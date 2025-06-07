struct Nested {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

struct Top {
    ni: Nested;
    bj: Bool;
    opt: String?;
}

contract Storage {
    top: Top = Top{
        ni: Nested{
            i: 1,
            b: false,
            s: "",
            o: null,
        },
        bj: false,
        opt: null
    };
    receive() {
        let _ = self.top.ni.i;
    }
}