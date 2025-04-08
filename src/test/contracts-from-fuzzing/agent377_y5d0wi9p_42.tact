struct Rec1 { next: Rec2?; }
struct Rec2 { next: Rec3?; }
struct Rec3 { val: Int?; }

contract ChainRec {
 r: Rec1 = Rec1{next: Rec2{next: Rec3{val: null}}};
}