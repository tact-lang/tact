struct S {
    s: String;
    sOpt: String?;
}

contract C {
    data: S;
    init() {
        self.data = S{
            s: "hello",
            sOpt: null,
        };
    }
}