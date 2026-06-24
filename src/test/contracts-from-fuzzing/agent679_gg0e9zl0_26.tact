// Struct with optional string, bool and int for nested optional mix
struct OptMix {
    foo: String?;
    bar: Bool?;
    baz: Int?;
}

contract TestContract {
    om: OptMix;

    init() {
        self.om = OptMix{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}