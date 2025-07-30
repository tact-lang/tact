struct Rec1 {
    x: Int;
}

struct Rec2 {
    r1: Rec1;
}

struct Rec3 {
    r2: Rec2;
}

contract ChainTest {
    val: Rec3;

    init() {
        self.val = Rec3{r2: Rec2{r1: Rec1{x: 99}}};
    }
}