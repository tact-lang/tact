struct Inner {
    i: Int = 5;
    s: String?;
}

struct Middle {
    inner1: Inner;
    inner2: Inner;
}

contract WideNested {
    mid: Middle = Middle{
        inner1: Inner{i: 10, s: null},
        inner2: Inner{i: 20, s: null},
    };
}