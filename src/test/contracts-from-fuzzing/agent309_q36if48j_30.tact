struct BoolMixin {
    a: Bool;
    b: Int;
    c: Bool;
}

contract MixBoolAndInt {
    s: BoolMixin;

    init() {
        self.s = BoolMixin{a:true,b:42,c:false};
    }
}