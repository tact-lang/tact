struct In1 {
    a: Int;
}

struct In2 {
    b: Int;
}

struct Top {
    x: Int;
    y: In1;
    z: In2;
}

contract SeveralInner {
    data: Top;

    init() {
        self.data = Top{
            x:10,
            y: In1{a:20},
            z: In2{b:30}
        };
    }
}