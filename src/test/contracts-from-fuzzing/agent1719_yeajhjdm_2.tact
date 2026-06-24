struct ComplexInner {
    x: Int;
    y: Int;
    note: String;
}

struct Container {
    a: Int;
    b: ComplexInner;
    c: Int?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            a: 10,
            b: ComplexInner{
                x: 1,
                y: 2,
                note: "nested"
            },
            c: null
        };
    }
}