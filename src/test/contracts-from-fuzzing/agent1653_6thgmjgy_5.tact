struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
}

contract TestContract {
    data: S1;

    init() {
        self.data = S1{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: false,
            f: "bye"
        };
    }
}