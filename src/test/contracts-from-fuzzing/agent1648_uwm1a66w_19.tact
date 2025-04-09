struct Stuff {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
}

contract OptionalMix {
    state: Stuff;

    init() {
        self.state = Stuff{ a:null, b:true, c:42, d:null };
    }
}