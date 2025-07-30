struct Rec {
    a: Int;
    b: Bool;
    c: String;
}

contract WDefault {
    r: Rec = Rec{ a:1, b:true, c:"hi" };

    init() {
        self.r = Rec{ a:2, b:false, c:"bye" };
    }
}
