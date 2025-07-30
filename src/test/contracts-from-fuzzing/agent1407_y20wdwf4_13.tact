struct S {
    s: String;
    b: Bool?;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            s: "hello",
            b: null
        };
    }
}