struct Inner {
    x: Int;
    y: Int;
}

struct Wrapper {
    one: Inner;
    two: Inner;
    three: Inner;
}

contract MultiNested {
    big: Wrapper;

    init() {
        self.big = Wrapper{
            one: Inner{x:1,y:2},
            two: Inner{x:3,y:4},
            three: Inner{x:5,y:6}
        };
    }
}
