struct SInner {
    num: Int;
    text: String;
}

struct SOuter {
    innerA: SInner;
    innerB: SInner;
    innerC: SInner;
}

contract NestedMultiField {
    outer: SOuter;

    init() {
        self.outer = SOuter{
            innerA: SInner{num:1,text:"a"},
            innerB: SInner{num:2,text:"b"},
            innerC: SInner{num:3,text:"c"}
        };
    }
}