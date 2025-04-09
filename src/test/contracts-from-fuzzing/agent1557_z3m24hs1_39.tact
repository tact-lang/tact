struct DefaultsMix {
    a: Int = 1;
    b: Bool;
    c: String = "ok";
}

contract StructSemiDefaults {
    store: DefaultsMix;

    init() {
        self.store = DefaultsMix{ b:true };
    }
}