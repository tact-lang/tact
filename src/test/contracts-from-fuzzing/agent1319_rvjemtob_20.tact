struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}
struct Inner3 {
    c: String;
}

struct ContainerMulti {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract MultiInnerStructsTest {
    data: ContainerMulti;

    init() {
        self.data = ContainerMulti {
            i1: Inner1 { a: 1 },
            i2: Inner2 { b: false },
            i3: Inner3 { c: "ok" }
        };
    }
}