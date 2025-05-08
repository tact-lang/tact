struct Sub {
    val: Int?;
}

struct Holder {
    s1: Sub;
    s2: Sub;
}

contract NestedOptStructs {
    h: Holder;

    init() {
        self.h = Holder{
            s1: Sub{ val: null },
            s2: Sub{ val: null }
        };
    }
}