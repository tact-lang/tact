struct InnerMap { m: map<Int, Int>; }

struct OuterMap { im: InnerMap; }

contract TestMapNested {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(5, 555);
        let o: OuterMap = OuterMap { im: InnerMap { m: m } };
        dump(o.im.m.get(5));
    }
}
