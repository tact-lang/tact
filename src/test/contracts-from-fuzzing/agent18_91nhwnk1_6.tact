struct OptionalStruct {
    maybe: Int?;
    val: Int;
}

struct MapStruct {
    data: map<Int, Int>;
    extra: Int;
}

struct NestedComplex {
    opt: OptionalStruct;
    ms: MapStruct;
    extra: Int;
}

contract TestContract {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(3, 333);
        let ms = MapStruct { data: m, extra: 444 };
        let os = OptionalStruct { maybe: 789, val: 101112 };
        let nc = NestedComplex { opt: os, ms: ms, extra: 555 };
        let a = nc.opt.val;
        let b = nc.ms.extra;
        let c = nc.opt.maybe;
    }
}
