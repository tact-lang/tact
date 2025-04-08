struct Alpha {
    v: Int;
}

struct Beta {
    flag: Bool;
}

struct Outer {
    one: Alpha?;
    two: Beta;
}

contract NestedOptionalReq {
    state: Outer;

    init() {
        self.state = Outer{
            one: null,
            two: Beta{ flag:true }
        };
    }
}