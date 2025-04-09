struct StructA { ivalue: Int }
struct StructB { bvalue: Bool }
struct StructC { svalue: String }

struct Container {
    a: StructA;
    b: StructB;
    c: StructC;
}

contract StructOfStructs {
    big: Container;
    init() {
        self.big = Container{
            a: StructA{ ivalue:1 },
            b: StructB{ bvalue:true },
            c: StructC{ svalue:"x" }
        };
    }
}