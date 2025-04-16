struct Rec1 {
    val: Int;
}

struct Rec2 {
    r: Rec1;
}

struct Rec3 {
    r: Rec2;
}

contract RecursionTest {
    storage: Rec3;
    init() {
        self.storage = Rec3{r: Rec2{r: Rec1{val: 123}}};
    }
}