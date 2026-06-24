struct DefaultOptional {
    s: String? = null;
    b: Bool? = null;
}

contract StructWithDefaultNulls {
    data: DefaultOptional;
    init() {
        self.data = DefaultOptional{
            s: null,
            b: null,
        };
    }
}