struct SubSub {
    alpha: Int;
    beta: Bool;
}

struct Sub {
    ss1: SubSub;
    ss2: SubSub;
    optInt: Int?;
}

contract WideNested {
    sub1: Sub;
    sub2: Sub;

    init() {
        self.sub1 = Sub{
            ss1: SubSub{ alpha: 1, beta: true },
            ss2: SubSub{ alpha: 2, beta: false },
            optInt: 42
        };
        self.sub2 = Sub{
            ss1: SubSub{ alpha: 3, beta: true },
            ss2: SubSub{ alpha: 4, beta: false },
            optInt: null
        };
    }
}
