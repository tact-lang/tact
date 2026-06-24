struct MiddleDefaults {
    a: Int;
    b: Int = 20;
    c: Int;
    d: Int = 40;
    e: Int;
}

contract TestContract {
    s: MiddleDefaults;

    init() {
        self.s = MiddleDefaults{
            a:1,
            c:2,
            e:3
        };
    }
}