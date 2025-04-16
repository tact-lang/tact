struct CtorParams {
    p1: Int;
    p2: Bool;
    p3: String;
}

contract ParamInit {
    data: CtorParams;

    init() {
        self.data = CtorParams{
            p1: 123,
            p2: false,
            p3: "hello"
        };
    }
}