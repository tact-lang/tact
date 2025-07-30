struct InnerStruct {
    f: Bool;
}

struct OuterStruct {
    arr1: InnerStruct;
    arr2: InnerStruct;
}

contract MultiNestedSameType {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            arr1: InnerStruct{f:true},
            arr2: InnerStruct{f:false}
        };
    }
}
