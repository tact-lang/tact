struct Rec1 { r2: Rec2; }
struct Rec2 { r3: Rec3; }
struct Rec3 { r4: Rec4; }
struct Rec4 { val: Int; }

contract TestContract {
    rec: Rec1;

    init() {
        self.rec = Rec1{ r2: Rec2{ r3: Rec3{ r4: Rec4{ val:42 } } } };
    }
}