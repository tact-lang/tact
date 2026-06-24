struct Middle {
    f: Int;
}

struct Container {
    a: Middle;
    b: Middle;
    c: Middle;
    d: Middle;
    e: Middle;
}

contract Test {
    data: Container;
    init() {
        self.data = Container{
            a: Middle{f:1}, b:Middle{f:2}, c:Middle{f:3}, d:Middle{f:4}, e:Middle{f:5}
        };
    }
}
