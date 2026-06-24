struct InnerOptOptional {
    x: Int?;
}

struct OuterOptOptional {
    y: InnerOptOptional?;
}

contract WrapOptStruct {
    z: OuterOptOptional?;
    init() {
        self.z = null;
    }
}
