struct SNested1 { v: Int }
struct SNested2 { s1: SNested1 }
struct SNested3 { s2: SNested2 }
struct SNested4 { s3: SNested3 }
struct SNested5 { s4: SNested4 }

struct Combo {
    a: SNested5;
    b: Int;
    c: Bool;
    d: String;
    e: Cell;
}

contract ComplexNestedMix {
    x: Combo;
    init() {
        self.x = Combo{
            a: SNested5{ s4: SNested4{ s3: SNested3{ s2: SNested2{ s1: SNested1{ v:11 }}}}},
            b:42,c:true,d:"q",e:emptyCell()
        };
    }
}