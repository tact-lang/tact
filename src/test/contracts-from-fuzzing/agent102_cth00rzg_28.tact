struct Param {
    x: Int;
}

contract ParamBeforeInit {
    a: Int;
    s: Param;

    init() {
        self.a = 2;
        self.s = Param{ x: 3 };
    }
}