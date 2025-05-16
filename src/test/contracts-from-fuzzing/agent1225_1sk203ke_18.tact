struct StructA { a: Int; }
struct StructB { a: Int; b: StructA; }
struct StructC { a: Int; b: StructB; c: StructA; }

contract RepeatInnerStruct {
    data: StructC;

    init() {
        self.data = StructC{
            a: 1,
            b: StructB{ a: 2, b: StructA{a:3} },
            c: StructA{ a:4 }
        };
    }
}