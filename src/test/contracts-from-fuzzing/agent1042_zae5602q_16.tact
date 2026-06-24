struct Inner {
    a: Int;
    b: Int;
}

struct Wrapper {
    x: Int;
    y: Int;
    n1: Inner;
    n2: Inner;
    n3: Inner;
    n4: Inner;
}

contract MultipleNestedSame {
    s: Wrapper = Wrapper{
        x: 1,
        y: 2,
        n1: Inner{a:3, b:4},
        n2: Inner{a:5, b:6},
        n3: Inner{a:7, b:8},
        n4: Inner{a:9, b:10}
    };
}