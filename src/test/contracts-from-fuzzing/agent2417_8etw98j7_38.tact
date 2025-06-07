struct StructA { a:Int; }
struct StructB { b:Bool; }
struct StructC { c:String; }

struct Nested {
    sA: StructA?;
    sB: StructB?;
    sC: StructC?;
}

contract OptionalWrappers {
    n: Nested;

    init() {
        self.n = Nested{
            sA: StructA{ a:1 },
            sB: null,
            sC: StructC{ c:"ok" }
        };
    }
}
