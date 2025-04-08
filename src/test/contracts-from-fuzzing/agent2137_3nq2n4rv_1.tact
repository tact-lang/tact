struct NestedOpt {
    inner: InnerStruct?; 
}

struct InnerStruct {
    val: Int;
}

contract TestDeepOptional {
    data: NestedOpt; 

    init() {
        self.data = NestedOpt{ inner: null };
    }
}