struct OptionalDeep {
    a: Int?;
    b: Bool?;
}

struct Container {
    inner: OptionalDeep?;
}

contract OptionalDeepContract {
    data: Container;

    init() {
        self.data = Container {
            inner: OptionalDeep{ a:null, b:true }
        };
    }
}