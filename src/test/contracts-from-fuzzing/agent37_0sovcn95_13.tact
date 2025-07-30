struct MapAlias {
    m: map<Int, Int>
}

struct MixedInner {
    x: Int;
    ma: MapAlias;
}

struct MixedOuter {
    a: Int;
    b: Int?;
    inner: MixedInner?;
    m: map<Int, Int>
}

contract TestMixedComplex {
    receive() {
        let o: MixedOuter = MixedOuter {
            a: 101,
            b: 202,
            inner: null,
            m: emptyMap()
        };
        o.a;
    }
}
