struct EmbedMul {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract EmbedMulTest {
    data: EmbedMul;

    init() {
        self.data = EmbedMul{
            a: 1,
            b: false,
            c: "h",
            d: null,
            e: null,
            f: null
        };
    }
}