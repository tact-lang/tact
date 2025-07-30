struct Inner {
    flag: Bool;
}

struct Middle {
    mid: Inner;
    val: Int;
}

contract NestedManyTypes {
    f: Middle;

    init() {
        self.f = Middle{
            mid: Inner{flag: true},
            val: 7
        };
    }
}
