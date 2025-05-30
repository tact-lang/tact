struct Inner {
    X: Int;
}

struct Complex {
    Options: Int?;
    MapF: map<Int, Inner>;
    Nested: Inner;
}

contract TestComplexOptional {
    receive() {
        let m: map<Int, Inner> = emptyMap();
        m.set(1, Inner { X: 100 });
        let c = Complex {
            Options: null,
            MapF: m,
            Nested: Inner { X: 200 }
        };
        let opt_val: Int = c.Options != null ? c.Options!! : 0;
        let res = opt_val + c.Nested.X;
        res;
    }
}
