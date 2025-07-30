struct Rec1 { x: Int; }
struct Rec2 { r: Rec1; }
struct Rec3 { r: Rec2; }
struct Rec4 { r: Rec3; }
struct Rec5 { r: Rec4; }

contract TestContract {
    val: Rec5;
    init() {
        self.val = Rec5{r: Rec4{r: Rec3{r: Rec2{r: Rec1{x:42}}}}};
    }
}