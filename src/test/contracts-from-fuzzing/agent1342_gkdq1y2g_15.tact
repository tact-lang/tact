struct Submeta {
    id: Int;
    flag: Bool;
}

struct Meta {
    name: String;
    desc: String;
    sub: Submeta;
}

struct BigMeta {
    meta1: Meta;
    meta2: Meta;
    optmeta: Meta?;
    flag: Bool;
    label: String;
}

contract NestedMetaTest {
    metaHolder: BigMeta;

    init() {
        self.metaHolder = BigMeta{
            meta1: Meta{ name:"one", desc:"first", sub: Submeta{ id:1, flag:true } },
            meta2: Meta{ name:"two", desc:"second", sub: Submeta{ id:2, flag:false } },
            optmeta: null,
            flag: true,
            label: "testing"
        };
    }
}