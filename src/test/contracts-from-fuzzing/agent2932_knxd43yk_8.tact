struct Rec1 {
    val: Int;
    rec2: Rec2;
}

struct Rec2 {
    val: Int;
    rec3: Rec3;
}

struct Rec3 {
    val: Int;
}

contract DeeplyNested {
    field: Rec1;

    init() {
        self.field = Rec1{
            val: 1,
            rec2: Rec2{ val: 2, rec3: Rec3{ val: 3 } }
        };
    }
}