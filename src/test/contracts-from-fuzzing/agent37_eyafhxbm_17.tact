struct S {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: String?;
    f5: Bool;
    f6: Bool?;
}

contract TestContract {
    s: S = S{
        f1: 1,
        f2: null,
        f3: "x",
        f4: null,
        f5: true,
        f6: null
    };

    init(){
        self.s = S{
            f1: 2,
            f2: 20,
            f3: "y",
            f4: "yy",
            f5: false,
            f6: true
        };
    }
    receive() {}
}