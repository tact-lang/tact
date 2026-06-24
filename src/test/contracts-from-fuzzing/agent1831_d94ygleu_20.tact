struct Rec1 { next: Rec2 }
struct Rec2 { next: Rec3 }
struct Rec3 { value: Int }

contract TestContract {
    rec: Rec1;

    init() {
        self.rec = Rec1{ next: Rec2{ next: Rec3{ value: 7 } } };
    }
}