struct Alternate {
    x: Int;
    y: Bool;
    z: String;
}

contract FieldOrder {
    f: Int;
    g: Alternate;

    init() {
        self.f = 1;
        self.g = Alternate{
            x:5,
            y:true,
            z:"hello"
        };
    }
}
