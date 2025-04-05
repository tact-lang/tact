struct Tuple2 { fst: Int; snd: Int; }

struct DeepComplex {
    m: map<Int, Int>;
    tup: Tuple2;
    opt: Int?;
}

contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 101);
        let dc: DeepComplex = DeepComplex {
            m: m,
            tup: Tuple2 { fst: 42, snd: 43 },
            opt: null
        };
        return;
    }
}
