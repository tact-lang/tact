struct WideNested {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    s1: String; s2: String; s3: String;
    f: Bool; g: Bool;
}

contract NestedWide {
    val: WideNested;

    init() {
        self.val = WideNested{
            a:1, b:2, c:3, d:4, e:5,
            s1:"x", s2:"y", s3:"z",
            f:true, g:false,
        };
    }
}