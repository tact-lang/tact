struct Inner {
    x: Int;
    y: Int;
}

struct Wrapper {
    opt1: Inner?;
    opt2: Inner?;
    opt3: Inner?;
    num: Int;
    flag: Bool;
}

contract MultiOptionWrapper {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            opt1: null,
            opt2: Inner{x:1,y:2},
            opt3: null,
            num: 42,
            flag: true
        };
    }
}