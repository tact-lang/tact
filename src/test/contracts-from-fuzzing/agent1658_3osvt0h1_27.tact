struct A { f1: Int; f2: Bool; }
struct B { f3: String; f4: Address; }
struct C { f5: Cell; f6: Slice; }

struct Mix3 {
    a: A;
    b: B;
    c: C;
}

contract TripleComposite {
    mix: Mix3;

    init() {
        self.mix = Mix3{
            a: A{ f1:1, f2:true },
            b: B{ f3:"hi", f4:myAddress() },
            c: C{ f5:emptyCell(), f6:emptyCell().asSlice() }
        };
    }
}