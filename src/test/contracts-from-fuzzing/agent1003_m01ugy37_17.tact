struct StructA { a: Int; b: Bool }
struct StructB { c: String; d: Address }
struct StructC { e: Int?; f: Bool? }

struct Top {
    a: StructA;
    b: StructB;
    c: StructC;
}

contract MultiStruct {
    data: Top;

    init() {
        self.data = Top{
            a: StructA{ a: 1, b: true },
            b: StructB{ c: "abc", d: myAddress() },
            c: StructC{ e: null, f: null }
        };
    }
}