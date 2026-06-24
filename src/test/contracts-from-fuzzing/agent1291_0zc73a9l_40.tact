struct MixedOptions {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract Test {
    m: MixedOptions;

    init() {
        self.m = MixedOptions{
            a:1, b:null, c:"x", d:null, e:true, f:null
        };
    }
}