struct Params {
    s: String;
    num: Int;
    flag: Bool;
}

contract Defaulted {
    par: Params = Params{
        s: "hello",
        num: 42,
        flag: false,
    };

    init() {
        self.par = Params{
            s: "override",
            num: 13,
            flag: true,
        };
    }
}
