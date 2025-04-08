struct HasImplicitNull {
    a: Int?;   // defaults to null
    b: Bool?; // defaults to null
}

contract ImplicitNulls {
    state: HasImplicitNull;

    init() {
        self.state = HasImplicitNull{
            a: null,
            b: null
        };
    }
}