struct Rec1 {
    next: Rec2?;
}

struct Rec2 {
    next: Rec3?;
}

struct Rec3 {
    val: Int;
}

contract NestedNullableRec {
    head: Rec1 = Rec1{next: Rec2{next: Rec3{val:5}}};
    init() {}
}