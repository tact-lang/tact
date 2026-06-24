struct InnerComplex {
    opt: Int?;
    mp: map<Int, Int>;
}

contract TestInnerComplex {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let ic = InnerComplex { opt: 123, mp: m };
        ic.opt;
        m.get(2);
    }
}
