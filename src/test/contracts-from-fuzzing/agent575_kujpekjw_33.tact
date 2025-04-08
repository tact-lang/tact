struct Mixed {
    foo: Int = 7;
    bar: String = "x";
    baz: Bool = true;
}

contract PunningDefaults {
    data: Mixed;

    init() {
        let baz = false;
        self.data = Mixed{ baz };
    }
}