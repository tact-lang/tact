struct Base {
    a: Int;
    b: Bool;
    c: Address;
}

struct Container {
    inner: Base;
    optInner: Base?;
}

contract TestContract {
    value: Container;

    init() {
        self.value = Container{
            inner: Base{ a:1, b:true, c:myAddress() },
            optInner: null
        };
    }
}