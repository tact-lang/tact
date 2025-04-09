struct Inner {
    a: Int;
    b: Int;
}

struct Container {
    ia: Inner;
    ib: Inner;
    ic: Inner;
    id: Inner;
    ie: Inner;
}

contract ManyStructs {
    data: Container;

    init() {
        self.data = Container{
            ia: Inner{a:1,b:2},
            ib: Inner{a:3,b:4},
            ic: Inner{a:5,b:6},
            id: Inner{a:7,b:8},
            ie: Inner{a:9,b:10},
        };
    }

    receive() {
        self.data = self.data;
    }
}