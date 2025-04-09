struct Bottom {
    x:Int;
}

struct Mid2 {
    x:Int;
    child:Bottom;
}

struct Mid1 {
    y:Int;
    child:Mid2;
}

struct Top {
    z:Int;
    child:Mid1;
}

contract DeeplyNested {
    data: Top;

    init() {
        self.data = Top{ z:1, child: Mid1{ y:2, child: Mid2{ x:3, child: Bottom{ x:4 } } } };
    }
}