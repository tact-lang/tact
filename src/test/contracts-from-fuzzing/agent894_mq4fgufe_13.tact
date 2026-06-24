struct SubA {
    i: Int;
    s: String;
}

struct SubB {
    b: Bool;
    a: Address;
}

struct Combo {
    sa: SubA;
    sb: SubB;
    c: Cell;
}

contract MultipleStructs {
    f: Combo;

    init() {
        self.f = Combo{
            sa: SubA{ i:1, s:"a" },
            sb: SubB{ b:true, a:myAddress() },
            c: emptyCell()
        };
    }
}