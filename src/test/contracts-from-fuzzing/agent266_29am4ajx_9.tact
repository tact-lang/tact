struct OptIntBool {
    foo: Int?;
    bar: Bool?;
}

contract OptDefaultContract {
    data: OptIntBool = OptIntBool{ foo: null, bar: true };

    init() {
        self.data = OptIntBool{
            foo: null,
            bar: false
        };
    }
}