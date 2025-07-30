struct InnerTuple {
    A: Int;
    B: Int;
}

struct Composite {
    OptTuple: InnerTuple?;
    M: map<Int, InnerTuple>;
}

contract TestComposite {
    receive() {
         let it: InnerTuple = InnerTuple { A: 1, B: 2 };
         let m: map<Int, InnerTuple> = emptyMap();
         m.set(100, it);
         let s: Composite = Composite { OptTuple: it, M: m };
         let a: Int = s.OptTuple!!.A;
    }
}
