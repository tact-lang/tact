struct Rec {
    x: Int;
}

contract ChangeAfterInit {
    r: Rec;
    init() {
        self.r = Rec{ x:1 };
        self.r = Rec{ x:2 };
    }
}