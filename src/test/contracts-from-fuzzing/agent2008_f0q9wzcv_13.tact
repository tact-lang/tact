struct NestedMultiple {
    s1: String;
    s2: String?;
}

struct Wrapper {
    wid: Int;
    flags: Bool;
    nested: NestedMultiple;
}

contract NestedComplex {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            wid:19,
            flags:true,
            nested: NestedMultiple{ s1:"hello", s2:null }
        };
    }
}
