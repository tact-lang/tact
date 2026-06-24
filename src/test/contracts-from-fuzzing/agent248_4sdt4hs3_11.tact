struct Rec1 {
    val1: Int;
    rec2: Rec2;
}

struct Rec2 {
    val2: Int;
    rec3: Rec3;
}

struct Rec3 {
    val3: Int;
}

contract TestContract {
    r: Rec1;

    init() {
        self.r = Rec1{
            val1: 1,
            rec2: Rec2{ val2: 2, rec3: Rec3{ val3: 3 } }
        };
    }
}