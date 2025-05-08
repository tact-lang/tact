struct MixDefaultsOpt {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixedOptions {
    storage: MixDefaultsOpt;

    init() {
        self.storage = MixDefaultsOpt{
            a:1, b:null, c:true, d:null, e:"ok", f:null
        };
    }
}