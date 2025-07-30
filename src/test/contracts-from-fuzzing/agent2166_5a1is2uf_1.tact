struct Nested {
    a: Int;
    b: Bool;
}

contract TestSimpleFields {
    x: Int;
    y: Bool;
    z: String;
    nest: Nested;

    init() {
        self.x = 10;
        self.y = true;
        self.z = "hello";
        self.nest = Nested{a:5, b:false};
    }
}