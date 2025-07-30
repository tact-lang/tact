struct Rec1 {
    opt: Rec2?;
}

struct Rec2 {
    val: Int;
}

contract OptionalNestedStructPersistence {
    rec: Rec1;
    init() {
        self.rec = Rec1{ opt: null };
    }
}