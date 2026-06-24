struct X {
    y: Y;
    z: Int;
}

struct Y {
    msg: String;
}

contract XY {
    top: X;

    init() {
        self.top = X{
            y: Y{msg:"test"},
            z: 42
        };
    }
}
