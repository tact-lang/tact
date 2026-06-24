struct OuterMost {
    middle: MiddleL;
    num: Int;
}

struct MiddleL {
    inner: InnerL;
    flag: Bool;
}

struct InnerL {
    msg: String;
    alive: Bool;
}

contract WideAndDeep {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: MiddleL{
                inner: InnerL{msg:"hi", alive:true},
                flag:false
            },
            num:42
        };
    }
}