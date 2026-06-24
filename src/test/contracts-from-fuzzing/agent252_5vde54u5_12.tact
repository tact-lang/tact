struct SInner {
    foo: Int;
    bar: Bool;
}

message(0x1111) MInner {
    baz: Int;
    qux: SInner;
}

struct TopStruct {
    s: SInner;
    m: MInner;
}

contract EmbedMsgInStruct {
    val: TopStruct;

    init() {
        self.val = TopStruct{
            s: SInner{foo:1, bar:true},
            m: MInner{baz:2, qux:SInner{foo:3, bar:false}}
        };
    }
}