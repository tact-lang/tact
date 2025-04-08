// persistent state using nested optionals on nested structs, single optional inside outer
struct Inner1 {
    foo: Int;
}

struct Outer1 {
    inner: Inner1?;
    bar: Int;
}

contract TestContract {
    data: Outer1;

    init() {
        self.data = Outer1{
            inner: null,
            bar: 999
        };
    }
}
