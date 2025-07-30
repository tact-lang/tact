struct InnerMap {
    m: map<Int, Int>;
}

struct OuterMap {
    im: InnerMap;
    opt: Int?;
}

contract TestMapNested {
    receive() {
        let im: InnerMap = InnerMap { m: emptyMap() };
        let om: OuterMap = OuterMap { im: im, opt: null };
        return;
    }
}
