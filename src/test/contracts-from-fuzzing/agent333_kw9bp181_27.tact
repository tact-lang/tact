struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

struct WrapOpt {
    inner: MultiOptional;
    number: Int;
}

contract TestContract {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            inner: MultiOptional{
                a:null, b:null, c:null, d:null, e:null
            },
            number: 123
        };
    }
}