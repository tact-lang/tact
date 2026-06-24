struct Rec0 {
    val: Int;
}

struct Rec1 {
    a: Rec0;
}

struct Rec2 {
    a: Rec1;
}

struct Rec3 {
    a: Rec2;
}

contract VeryDeepStruct {
    data: Rec3;

    init() {
        self.data = Rec3{a: Rec2{a: Rec1{a: Rec0{val: 42}}}};
    }

    receive() {
        self.data = Rec3{a: Rec2{a: Rec1{a: Rec0{val: 99}}}};
    }
}
