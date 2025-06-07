struct Rec {
    val: Int;
}

struct Container {
    rec1: Rec;
    rec2: Rec;
    rec3: Rec;
    rec4: Rec;
    rec5: Rec;
}

contract TestContract {
    c1: Container;
    c2: Container;

    init() {
        let r = Rec{ val: 99 };
        let cont = Container{ rec1:r, rec2:r, rec3:r, rec4:r, rec5:r };
        self.c1 = cont;
        self.c2 = cont;
    }
}