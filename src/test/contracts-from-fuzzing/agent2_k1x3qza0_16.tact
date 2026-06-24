struct InnerMap {
    entries: map<Int, Int>;
    opt: Int? = 0;
}

struct MiddleMap {
    inner: InnerMap;
    m: Int;
}

struct OuterMap {
    middle: MiddleMap;
    o: Int;
}

fun makeOuterMap() : OuterMap {
    return OuterMap{
        middle: MiddleMap{
            inner: InnerMap{
                entries: emptyMap(),
                opt: 50
            },
            m: 7
        },
        o: 300
    };
}

contract Test {
    receive() {
         let om = makeOuterMap();
         om.middle.inner.entries.set(2, 200);
         let val_from_map: Int = om.middle.inner.entries.get(2)!!;
         let total = om.middle.m + om.o + val_from_map + om.middle.inner.opt!!;
    }
}
