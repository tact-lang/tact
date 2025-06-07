struct InnerStruct {
    a: Int;
    b: Int;
    c: Int?;
}

struct OuterStruct {
    inner: InnerStruct;
    val: Int;
    mapping: map<Int, Int>;
}

contract TestContract {
    receive() {
        let innerInst: InnerStruct = InnerStruct{ a: 10, b: 20, c: 30 };
        let mp: map<Int, Int> = emptyMap();
        mp.set(1, 100);
        let outer: OuterStruct = OuterStruct{ inner: innerInst, val: 999, mapping: mp };
        outer.inner.a;
    }
}
