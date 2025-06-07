struct A { val: Int; }
struct B { val: Bool; }
struct C { val: Address; }
struct D { val: Slice; }
struct E { val: Cell; }
struct F { val: String; }

struct Complex {
    sa: A;
    sb: B;
    sc: C;
    sd: D;
    se: E;
    sf: F;
}

contract Combo {
    c: Complex;

    init() {
        self.c = Complex{
            sa: A{val:1},
            sb: B{val:true},
            sc: C{val:myAddress()},
            sd: D{val:emptyCell().asSlice()},
            se: E{val:emptyCell()},
            sf: F{val:"hello"}
        };
    }
}