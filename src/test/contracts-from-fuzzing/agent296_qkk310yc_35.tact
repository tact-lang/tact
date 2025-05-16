struct Combined {
    a: Int;
    b: Bool?;
    c: String;
}

contract CombinedFields {
    x: Int;
    y: Bool?;
    z: Combined;

    init() {
        self.x = 7;
        self.y = null;
        self.z = Combined{a:1, b:true, c:"str"};
    }
}
