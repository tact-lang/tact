struct A { x: Int; y: Int; }

contract StructArranged {
    a: A; b: A; c: A;

    init() {
        self.a=A{x:1,y:2}; self.b=A{x:3,y:4}; self.c=A{x:5,y:6};
    }
}
