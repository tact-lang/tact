struct Composition {
    x: Int;
    y: String;
    z: Bool;
}

contract ComposeDefaults {
    a: Composition = Composition{x:1,y:"abc",z:true};

    init() {
        // leave as default
    }
}