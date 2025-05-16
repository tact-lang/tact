struct Levels {
    mid1: Mid;
    mid2: Mid;
}

struct Mid {
    a: Int;
    b: Int;
    inner: Low;
}

struct Low {
    flag: Bool;
    note: String;
}

contract DeepMulti {
    data: Levels;

    init() {
        self.data = Levels{
            mid1: Mid{ a:1, b:2, inner: Low{flag:true, note:"a"}},
            mid2: Mid{ a:3, b:4, inner: Low{flag:false, note:"b"}},
        };
    }
}
