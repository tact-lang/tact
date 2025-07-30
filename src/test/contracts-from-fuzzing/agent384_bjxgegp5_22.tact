struct MultipleNested {
    nested1: Level1;
    nested2: Level2;
}

struct Level1 {
    v1: Int;
    v2: String;
}

struct Level2 {
    inner: InnerLevel;
}

struct InnerLevel {
    flag: Bool;
    text: String;
}

contract ManyNestedFields {
    storage: MultipleNested = MultipleNested{
        nested1: Level1{v1:1,v2:"hello"},
        nested2: Level2{inner: InnerLevel{flag:true,text:"world"}}
    };

    init() {
        self.storage.nested2.inner.flag = false;
    }
}