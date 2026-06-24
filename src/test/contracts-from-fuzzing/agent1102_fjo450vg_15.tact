// Long struct with various primitive fields
struct LongPrimitives {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: String;
    h: String;
    i: Address;
    j: Address;
    k: Int?;
    l: Int?;
    m: Bool?;
    n: Bool?;
    o: String?;
    p: String?;
    q: Address?;
    r: Address?;
}

contract ManyPrimitivesContract {
    data: LongPrimitives;

    init() {
        self.data = LongPrimitives{
            a: 1, b: 2, c: 3, d: 4,
            e: true, f: false,
            g: "hi", h: "there",
            i: myAddress(), j: myAddress(),
            k: 5, l: null,
            m: null, n: true,
            o: null, p: "yo",
            q: null, r: myAddress()
        };
    }
}
