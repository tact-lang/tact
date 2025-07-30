struct Compose {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrap1 {
    inner: Compose;
}

struct Wrap2 {
    inner: Wrap1;
}

contract NestedCompose {
    st: Wrap2;

    init() {
        self.st = Wrap2{
            inner: Wrap1{
                inner: Compose{
                    a: 1, b: true, c: "test"
                }
            }
        };
    }
}
