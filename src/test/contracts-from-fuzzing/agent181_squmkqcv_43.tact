struct BigBoolOpt {
    a: Bool?; b: Bool?; c: Bool?; d: Bool?; e: Bool?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
}

contract ManyBoolOpts {
    val: BigBoolOpt;

    init() {
        self.val = BigBoolOpt{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null
        };
    }
}
