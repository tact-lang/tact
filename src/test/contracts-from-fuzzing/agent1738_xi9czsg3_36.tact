struct Sub {
    x: Int;
    y: String;
}

contract Combo {
    s: Sub;
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.s=Sub{x:1,y:"y"};
        self.a=2;
        self.b=true;
        self.c="str";
    }
}