struct A {
    x: Int;
    y: String;
}

struct B {
    inner: A;
    f: Bool;
}

contract Overwrite {
    info: B;

    init() {
        self.info = B{
            inner: A{ x: 1, y: "start" },
            f: false
        };
        self.info = B{
            inner: A{ x: 42, y: "again" },
            f: true
        };
    }
}
