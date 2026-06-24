struct OuterOptional {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructInsideStruct {
    data: OuterOptional;
    z: Int;
    
    init() {
        self.data = OuterOptional { innerOpt: null };
        self.z = 404;
    }
}