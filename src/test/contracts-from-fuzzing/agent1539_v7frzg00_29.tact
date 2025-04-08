struct Inners {
    s: String;
    b: Bool;
}

contract InlineMany {
    a: Int;
    x: Inners;
    y: Inners;
    z: Inners;
    init() {
        self.a = 1;
        self.x = Inners{s:"x", b:true};
        self.y = Inners{s:"y", b:false};
        self.z = Inners{s:"z", b:true};
    }
}