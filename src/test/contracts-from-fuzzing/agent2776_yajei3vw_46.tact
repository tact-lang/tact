struct Rec1 { 
    num: Int?; 
}

struct Rec2 {
    rec: Rec1?;
}

contract OptionalRecursive {
    val: Rec2;
    init() {
        self.val = Rec2{ rec: null };
    }
}
