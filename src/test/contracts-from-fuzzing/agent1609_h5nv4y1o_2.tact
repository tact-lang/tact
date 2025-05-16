struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            inner: Inner{
                foo: 1,
                bar: false
            },
            count: 42
        };
    }

    receive() {
        self.data = Outer{
            inner: Inner{
                foo: 7,
                bar: true
            },
            count: 99
        };
    }
}