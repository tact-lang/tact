struct Inner1 { val: Int }
struct Inner2 { val: Bool }
struct Inner3 { val: String }

struct Container {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract MultipleInner {
    data: Container;

    init() {
        self.data = Container{
            a: Inner1{ val: 1 },
            b: Inner2{ val: true },
            c: Inner3{ val: "yo" }
        };
    }
}