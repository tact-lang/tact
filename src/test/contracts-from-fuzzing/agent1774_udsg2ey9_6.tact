struct Param {
    x: Int;
}

contract Test {
    param1: Param;
    param2: Param;
    param3: Param;

    init() {
        self.param1 = Param{x: 1};
        self.param2 = Param{x: 2};
        self.param3 = Param{x: 3};
    }
}