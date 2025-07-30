struct Rec {
    a: Int;
    b: Bool?;  
    c: String?;
}

contract Test {
    r: Rec;

    init() {
        self.r = Rec { a: 3, b: null, c: "hi" };
    }
}
