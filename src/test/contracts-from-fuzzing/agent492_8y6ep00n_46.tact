struct Inner {
    x: Int;
}

struct Container {
    a: Inner?;
    b: Inner?;
}

contract Foo {
    data: Container;

    init() {
        self.data = Container{a:null,b:null};
    }
}