struct BoolLayer {
    flag1: Bool;
    flag2: Bool?;
}

struct StringLayer {
    str1: String;
    str2: String?;
}

struct TopLayer {
    a: BoolLayer;
    b: StringLayer;
    c: Int;
}

contract CombinedLayers {
    top: TopLayer;

    init() {
        self.top = TopLayer{
            a: BoolLayer{flag1:true, flag2:null},
            b: StringLayer{str1:"hi", str2:null},
            c: 5,
        };
    }
}