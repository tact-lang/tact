// deeply nested combination of Strings and optionals
struct InnerMost {
    s: String?;
}
struct InnerMid {
    inner: InnerMost?;
    str: String;
}
struct OuterMid {
    im: InnerMid?;
    flag: Bool;
}

contract DeepStringOptional {
    d: OuterMid;

    init() {
        self.d = OuterMid{ im:null, flag:true };
    }
}