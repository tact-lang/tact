struct ParamS { a: Int?; b: String? }

contract TestContract {
    foo: ParamS;

    init() {
        self.foo = ParamS{
            a: null,
            b: null,
        };
    }
}