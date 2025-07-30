struct Inner1 {
    a: Int;
    b: Bool?;
}

struct Inner2 {
    c: String;
    d: Int;
}

struct Container {
    x: Inner1;
    y: Inner2;
}

contract TestContract {
    composed: Container;

    init() {
        self.composed = Container{
            x: Inner1{a:1,b:true},
            y: Inner2{c:"hi", d:2}
        };
    }
}