struct Nested {
    val: Int?;
    flag: Bool;
}

struct BigMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
    nest: Nested?;
}

contract TestContract {
    state: BigMix;

    init() {
        self.state = BigMix{
            a:null, b:false, c:null, d:1, e:true, f:"yo", nest: null
        };
    }
}