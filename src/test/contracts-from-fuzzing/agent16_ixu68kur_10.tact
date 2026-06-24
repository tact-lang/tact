struct WithMap {
    m: map<Int, Int>;
    extra: Int
}

fun testWithMap(w: WithMap): Int {
    if (w.m.get(1) != null) {
         let v: Int = w.m.get(1)!!;
         return w.extra + v;
    }
    return w.extra;
}

contract TestMapField {
    receive() {
         let m: map<Int, Int> = emptyMap();
         m.set(1, 100);
         m.set(2, 200);
         let w: WithMap = WithMap{ m: m, extra: 10 };
         testWithMap(w);
    }
}
