struct Inner { n: Int; }
struct Container {
    a: Int;
    b: Inner?;
    c: Bool?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            a: 12,
            b: null,
            c: true
        };
    }
}