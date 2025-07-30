struct StructA { a: Int; b: Bool?; c: String; }
struct StructB { d: String?; e: Int; f: Bool; }
struct StructC { sA: StructA; sB: StructB; note: String; }

contract TestContract {
    myData: StructC;

    init() {
        self.myData = StructC{
            sA: StructA{
                a: 5,
                b: null,
                c: "a",
            },
            sB: StructB{
                d: "d",
                e: 6,
                f: true,
            },
            note: "note",
        };
    }
}