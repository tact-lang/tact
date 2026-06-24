struct Chain3 {
    x: Int;
    y: Slice;
}

struct Chain2 {
    prev: Chain3;
    s: String?;
}

struct Chain1 {
    sub: Chain2;
    b: Bool;
}

contract TestContract {
    data: Chain1;

    init() {
        self.data = Chain1{
            sub: Chain2{
                prev: Chain3{
                    x: 99,
                    y: emptyCell().asSlice(),
                },
                s: "hello",
            },
            b: true,
        };
    }
}