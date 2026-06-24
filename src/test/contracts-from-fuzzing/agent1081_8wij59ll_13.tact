struct Rec1 { val: Int; }
struct Rec2 { next: Rec1?; val2: String; }

contract OptionalChain {
    field: Rec2;
    
    init() {
        self.field = Rec2{ next: Rec1{val: 5}, val2: "x" };
    }
}