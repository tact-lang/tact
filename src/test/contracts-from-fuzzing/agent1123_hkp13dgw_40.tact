struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Outer {
    a: Inner1;
    b: Inner2;
}

contract SeparateNested {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner1{x:10},
            b: Inner2{y:20},
        };
    }
}