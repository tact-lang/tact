struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    myField: Inner;

    init() {
        self.myField = Inner{
            a: 1,
            b: true,
            c: "test",
        };
    }
}