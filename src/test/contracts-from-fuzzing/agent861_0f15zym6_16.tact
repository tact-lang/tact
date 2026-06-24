struct InnerS {
    a: Int;
    b: Bool;
}

struct OuterS {
    inner: InnerS;
    c: String;
}

contract StorageWithNested {
    data: OuterS;

    init() {
        self.data = OuterS{
            inner: InnerS{ a: 42, b: true },
            c: "hello"
        };
    }

    receive() {
        let _ = self.data;
    }
}