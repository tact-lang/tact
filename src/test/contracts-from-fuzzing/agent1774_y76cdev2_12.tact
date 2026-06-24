struct OptionalDeep {
    inner: Int?;
}

struct Wrapper {
    a: Int;
    o: OptionalDeep?;
    b: String;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            a: 5,
            o: OptionalDeep{inner:null},
            b: "hello"
        };
    }
}
