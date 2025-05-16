struct NestedOpt2 {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
}

struct Container {
    fixed: Int;
    inner: NestedOpt2;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            fixed: 42,
            inner: NestedOpt2{
                a: null,
                b: null,
                c: null,
                d: null,
                e: null
            }
        };
    }
}