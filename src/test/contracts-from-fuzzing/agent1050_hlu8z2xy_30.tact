struct MixOpt {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;
    f: Int;
}

contract MixOptTypes {
    val: MixOpt;

    init() {
        self.val = MixOpt{
            a:null, b:true, c:null, d:false, e:"e", f:5
        };
    }
}
