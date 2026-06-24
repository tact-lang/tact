struct DefNested {
    inn: Inn;
}

struct Inn {
    x:Int=5;
    y:Bool=false;
}

contract TestContract {
    d: DefNested;

    init() {
        self.d=DefNested{inn:Inn{}};
    }
}