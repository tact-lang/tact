struct Rec1 { a: Int?; }
struct Rec2 { r: Rec1?; }

contract OptLayers {
    f: Rec2 = Rec2{r:null};
    init() {
        self.f = Rec2{r:null};
    }
}