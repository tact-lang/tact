struct BigNested {
    a: Inner1;
    b: Inner2;
}

struct Inner1 {
    x: Int;
    y: String;
}

struct Inner2 {
    p: Bool;
    q: String?;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            a: Inner1{
                x: 42,
                y: "hello",
            },
            b: Inner2{
                p: true,
                q: null,
            },
        };
    }
}