const CONSTA: Int = 7;
const CONSTB: Bool = false;

struct InConst {
    x: Int;
    y: Bool;
}

contract WithConsts {
    a: InConst;
    init() {
        self.a = InConst{x:CONSTA, y:CONSTB};
    }
    receive() {
        self.a.x += 1;
    }
}