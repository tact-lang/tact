struct Param {
    s: String;
    n: Int?;
    b: Bool;
}

contract TestContract {
    param: Param;

    init() {
        self.param = Param{
            s: "zzz",
            n: null,
            b: true,
        };
    }
}