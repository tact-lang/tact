struct Rec1 {
    next: Rec2?;
}

struct Rec2 {
    next: Rec3?;
}

struct Rec3 {
    next: Rec4?;
}

struct Rec4 {
    val: Int?;
}

contract TestContract {
    rec: Rec1;
    init() {
        self.rec = Rec1{
            next: Rec2{
                next: Rec3{
                    next: Rec4{ val: null }
                }
            }
        };
    }
}