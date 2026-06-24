struct Deep {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            a: 1,
            b: true,
            c: "hello",
        };
    }
}