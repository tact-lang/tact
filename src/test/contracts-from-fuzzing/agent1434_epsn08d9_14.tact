struct LotsOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract OptsTest {
    data: LotsOptional = LotsOptional{
        a: null,
        b: 1,
        c: null,
        d: true,
        e: null,
        f: "hi"
    };

    receive() {}
}