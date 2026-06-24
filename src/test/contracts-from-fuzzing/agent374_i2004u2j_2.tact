struct Deep {
    inn: Inner;
    flag: Bool;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    deep: Deep;

    init() {
        self.deep = Deep{inn: Inner{foo: 1, bar: true}, flag: false};
    }
    
    receive() {
        let _ = self.deep.inn.foo;
    }
}