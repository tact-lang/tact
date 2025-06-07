struct Param {
    a: Int;
    b: Bool;
}

contract ParamUsage {
    stored: Param;

    init() {
        self.stored = Param{
            a: 100,
            b: false
        };
    }

    receive() {
        let x = self.stored.a;
        let y = self.stored.b;
    }
}