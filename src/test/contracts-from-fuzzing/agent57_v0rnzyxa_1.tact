struct NestedOptional {
    inner: Int?;
}

struct OuterStruct {
    nested: NestedOptional?;
    directOpt: Int?;
}

contract TestStorage {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            directOpt: null,
        };
    }
}