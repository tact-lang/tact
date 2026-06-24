struct Reordered {
    x: Int;
    y: String;
    z: Bool;
}

contract ReorderedStructFields {
    a: Reordered;
    b: Reordered;

    init() {
        self.a = Reordered{ x:1, y:"one", z:true };
        self.b = Reordered{ x:2, y:"two", z:false };
    }
}
