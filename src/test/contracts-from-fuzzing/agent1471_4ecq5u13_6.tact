struct Rec1 { next: Rec2; val: Int = 1; }
struct Rec2 { next: Rec3; val: Int = 2; }
struct Rec3 { val: Int = 3; }

contract Test {
    rec: Rec1 = Rec1{ next: Rec2{ next: Rec3{}, val: 2 }, val:1 };

    init() {
        self.rec = Rec1{
            next: Rec2{
                next: Rec3{val: 33},
                val: 22
            },
            val: 11
        };
    }
}