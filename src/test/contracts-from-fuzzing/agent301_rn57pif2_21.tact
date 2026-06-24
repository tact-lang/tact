struct Param {
    a: Int = 1;
    b: Bool;
    c: String = "hello";
}

contract TestContract {
    p: Param;

    init() {
        self.p = Param{
            b: true
        };
    }

    receive() {
        let _ = self.p.a;
    }
}