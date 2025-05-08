struct S {
    s: String;
    s_opt: String?;
    more: Int;
}

contract TestContract {
    sfield: S;

    init() {
        self.sfield = S{
            s: "hello",
            s_opt: null,
            more: 111,
        };
    }
}