struct Rec1 { next: Rec2 } 
struct Rec2 { next: Rec3 } 
struct Rec3 { next: Rec4 } 
struct Rec4 { next: Rec5 } 
struct Rec5 { leaf: Int } 

contract RecursiveDepth {
    rec: Rec1;

    init() {
        self.rec = Rec1 { next: Rec2 { next: Rec3 { next: Rec4 { next: Rec5 { leaf: 99 }}}}};
    }
}