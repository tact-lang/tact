struct OptAddressBool {
    a: Address?;
    b: Bool?;
}

contract TestOptAddressBool {
    data: OptAddressBool;

    init() {
        self.data = OptAddressBool{
            a: null,
            b: null
        };
    }
}
