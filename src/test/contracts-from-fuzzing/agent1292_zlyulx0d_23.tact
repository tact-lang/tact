struct Larger {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: String; g: String; h: Bool; i: Bool;
}

contract LargerContract {
    sVal: Larger;

    init() {
        self.sVal = Larger{
            a:1, b:2, c:3, d:4, e:5,
            f:"a", g:"b", h:true, i:false,
        };
    }
}