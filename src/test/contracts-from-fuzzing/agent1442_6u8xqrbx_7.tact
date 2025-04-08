struct Rec1 { rec2: Rec2 }
struct Rec2 { rec3: Rec3 }
struct Rec3 { val: Int }

contract TestContract {
    recfield: Rec1;
    init() {
        self.recfield = Rec1{rec2: Rec2{rec3: Rec3{val:42}}};
    }
}