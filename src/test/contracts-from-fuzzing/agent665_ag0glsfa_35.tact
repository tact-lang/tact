struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract AllMixed {
    m: MixedTypes = MixedTypes{
        i:1, b:true, s:"s", oi:null, ob:null, os:null
    };

    init() {
        self.m = MixedTypes{i:42, b:false, s:"ss", oi:5, ob:true, os:"non"};
    }

    receive() {
        let _ = self.m;
    }
}