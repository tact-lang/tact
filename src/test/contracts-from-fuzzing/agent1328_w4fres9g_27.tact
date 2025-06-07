// Nested struct with multiple optionals, test reassign null
struct Layered {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract AssignNullOpt {
    val: Layered;

    init() {
        self.val = Layered{ a:null, b:null, c:null };
        self.val = Layered{ a:null, b:null, c:null };
    }
}
