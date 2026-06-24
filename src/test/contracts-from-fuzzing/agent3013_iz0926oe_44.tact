// Struct with only optional fields
struct OptOnly {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptPure {
    storage: OptOnly;

    init() {
        self.storage = OptOnly{foo:null,bar:null,baz:null};
    }
}
