struct NestedMixed {
    a: Int;
    b: Bool?;
    c: String;
    d: InnerMixed;
}

struct InnerMixed {
    x: Bool;
    y: Int?;
}

contract MixedDeep {
    info: NestedMixed;

    init() {
        self.info = NestedMixed{
            a:1, b:null, c:"", d: InnerMixed{x:true,y:null}
        };
    }
}