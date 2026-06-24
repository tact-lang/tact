struct Base {
    x: Int;
    y: Bool;
}

struct Wrap1 {
    inner: Base;
}

struct Wrap2 {
    inner: Wrap1;
}

struct Wrap3 {
    inner: Wrap2;
}

struct Wrap4 {
    inner: Wrap3;
}

contract ManyWraps {
    data: Wrap4 = Wrap4{
        inner: Wrap3{
            inner: Wrap2{
                inner: Wrap1{
                    inner: Base{ x: 5, y: false }
                }
            }
        }
    };
}