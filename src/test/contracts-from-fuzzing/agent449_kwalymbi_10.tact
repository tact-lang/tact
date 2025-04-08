struct MultiLayer {
    s: String;
    i: Int;
    b: Bool;
    opt_s: String?;
    opt_b: Bool?;
    opt_i: Int?;
    str2: String;
    flag2: Bool;
}

contract TestContract {
    a: Int = 1;
    b: Bool = true;
    data: MultiLayer;

    init() {
        self.data = MultiLayer{
            s: "x",
            i: 2,
            b: false,
            opt_s: null,
            opt_b: null,
            opt_i: null,
            str2: "y",
            flag2: true,
        };
    }
}
