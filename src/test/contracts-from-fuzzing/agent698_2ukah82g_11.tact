struct Rec1 { next: Rec2?; val: Int; }
struct Rec2 { next: Rec3?; val: Int; }
struct Rec3 { val: Int; }

contract TestContract {
    r: Rec1;

    init() {
        self.r = Rec1{
            next: Rec2{
                next: Rec3{ val: 3 },
                val: 2
            },
            val:1
        };
    }
}