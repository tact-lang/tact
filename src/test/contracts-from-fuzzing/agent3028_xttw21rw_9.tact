struct InnerStruct {
    f1: Int;
    f2: Bool;
    f3: String?;
}

struct OuterStruct {
    arr1: InnerStruct;
    arr2: InnerStruct;
    arr3: InnerStruct;
}

contract MultipleNestedStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            arr1: InnerStruct{f1:1,f2:true,f3:null},
            arr2: InnerStruct{f1:2,f2:false,f3:null},
            arr3: InnerStruct{f1:3,f2:true,f3:null},
        };
    }
}
