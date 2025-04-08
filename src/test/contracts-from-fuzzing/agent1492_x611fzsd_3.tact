struct S1 { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; g: Int as uint8;
            h: Bool; i: String; j: Int?; k: Bool?; l: String?; }

contract WideStructTest {
    record: S1;

    init() {
        self.record = S1{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: 255,
            h: false,
            i: "yo",
            j: null,
            k: null,
            l: null,
        };
    }
}