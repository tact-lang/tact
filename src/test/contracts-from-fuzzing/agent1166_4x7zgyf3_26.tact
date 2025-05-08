// Sparse initializations with defaulted struct fields
struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int?;
}

contract DefaultsSparse {
    v: WithDefaults;

    init() {
        self.v = WithDefaults{
            d: null
        };
    }
}
