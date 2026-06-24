struct AA { x: Int }
struct BB { y: Int? }

contract ManyWraps {
    a: AA;
    b: BB;
    c: Int;
    d: Int?;

    init() {
        self.a = AA{x: 1};
        self.b = BB{y: null};
        self.c = 3;
        self.d = null;
    }
}