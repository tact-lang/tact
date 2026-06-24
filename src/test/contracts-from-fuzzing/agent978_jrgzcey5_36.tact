// contract with nested optional inner struct containing mixed primitives
struct Sub {
    a:Int; b:Int?; c:Bool; d:Bool?; e:String; f:String?;
}

struct Wrap {
    sub: Sub?;
    tag: Int;
}

contract OptInnerMixed {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            sub:null,
            tag:1
        };
    }
}