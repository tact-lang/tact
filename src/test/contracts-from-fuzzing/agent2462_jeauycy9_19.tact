struct Wrapped {
    x: Int;
    y: Bool;
    z: Bool?;
    s: String;
}

contract QQ {
    wrap: Wrapped;
    value: Int;
    optVal: Int?;

    init() {
        self.wrap = Wrapped{x: 77, y: false, z: null, s: "text"};
        self.value = 42;
        self.optVal = null;
    }
}