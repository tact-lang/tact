struct OptInMiddle {
    a: Int;
    b: Int?;
    c: Int;
}

contract MiddleOptional {
    d: OptInMiddle;

    init() {
        self.d = OptInMiddle {
            a:1, b:null, c:3
        };
    }
}
