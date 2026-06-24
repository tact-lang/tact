struct Rec1 {
    val1: Int = 5;
}

struct Rec2 {
    val2: Int = 6;
    rec1: Rec1;
}

struct Rec3 {
    val3: Int = 7;
    rec2: Rec2;
}

contract Recursive {
    data: Rec3 = Rec3{ rec2: Rec2{ rec1: Rec1{} } };
    init() {}
}