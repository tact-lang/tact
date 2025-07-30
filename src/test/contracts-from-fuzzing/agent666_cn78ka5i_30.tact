struct X {
    s: String;
    b: Bool;
    n: Int;
}

contract MixOpt {
    opt: X?;

    init() {
        self.opt = X{s:"str",b:true,n:42};
    }
}
