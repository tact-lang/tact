struct Inner {
    flag: Bool;
    count: Int;
}

struct HasMap {
    mm: map<Int, Inner>;
}

contract MapStruct {
    s: HasMap;
    init() {
        self.s = HasMap{ mm: emptyMap() };
    }
}