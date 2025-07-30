// Test nested structs where one internal nested has multiple optionals

struct NestedInner {
    foo: Int?;
    bar: Bool?;
    msg: String?;
}

struct NestedOuter {
    inner: NestedInner; 
    value: Int;
}

contract TestContract {
    state: NestedOuter;

    init() {
        self.state = NestedOuter{
            inner: NestedInner{
                foo: null,
                bar: null,
                msg: null
            },
            value: 123
        };
    }
}