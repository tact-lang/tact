struct Rec1 { i: Int }
struct Rec2 { rec1: Rec1 }
struct Rec3 { rec2: Rec2 }
struct Rec4 { rec3: Rec3 }

contract ManyNestedRecords {
    field: Rec4;

    init() {
        self.field = Rec4{rec3: Rec3{rec2: Rec2{rec1: Rec1{i: 99}}}};
    }
}