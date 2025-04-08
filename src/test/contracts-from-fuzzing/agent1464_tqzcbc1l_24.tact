struct RepeatedBoolOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
}

contract TestContract {
    r: RepeatedBoolOpt;

    init() {
        self.r = RepeatedBoolOpt{
            a:null, b:null, c:null,
            d:null, e:null, f:null
        };
    }
}