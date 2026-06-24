struct BothConstsVars {
    a: Int;
    b: Bool;
}

contract BothPersistentAndConsts {
    const X: Int = 123;
    const Y: String = "consty";
    data: BothConstsVars;

    init() {
        self.data = BothConstsVars{ a:1, b:true };
    }

    receive() {
        self.data = BothConstsVars{ a:2, b:false };
    }
}