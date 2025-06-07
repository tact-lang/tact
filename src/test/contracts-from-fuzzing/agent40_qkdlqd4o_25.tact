struct NestedOption {
    s: String?;
    b: Bool?;
}

struct OuterStruct {
    nested: NestedOption;
    flag: Bool;
    number: Int;
}

contract StorageNestedOptionalStruct {
    outer: OuterStruct;

    init() {
        self.outer = OuterStruct{
            nested: NestedOption{
                s:null,
                b:null
            },
            flag:true,
            number:42
        };
    }
}