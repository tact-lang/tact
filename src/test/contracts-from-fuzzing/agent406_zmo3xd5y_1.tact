struct Inner1 {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: Inner1;
    init() {
        self.data = Inner1{
            a: 1,
            b: true,
            c: "hello"
        };
    }
}