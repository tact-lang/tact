struct Rec1 {
    next: Rec2;
    data: Int;
}

struct Rec2 {
    next: Rec3;
    data: Int;
}

struct Rec3 {
    data: Int;
}

contract RecursiveWide {
    val: Rec1;
    init() {
        self.val = Rec1{
            data: 1,
            next: Rec2{
                data: 2,
                next: Rec3{ data: 3 },
            }
        };
    }
}