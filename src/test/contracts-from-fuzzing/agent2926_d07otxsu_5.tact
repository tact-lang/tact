struct InnerOptional {
    a: Int;
    b: Bool?;
}

struct OuterStruct {
    foo: Int;
    bar: InnerOptional?;
}

contract StructInStructOpt {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            foo: 777,
            bar: null
        };
    }
}