struct Inside {
    val: InnerStruct;
}

struct InnerStruct {
    foo: Int as uint16;
    bar: Bool?;
}

contract SerializeInside {
    content: Inside;
    init() {
        self.content = Inside{
            val: InnerStruct{foo:42, bar:null}
        };
    }
}