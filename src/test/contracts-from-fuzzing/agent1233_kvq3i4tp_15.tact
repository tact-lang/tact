struct MultiLayer {
    l1: Int?;
    l2: String?;
    l3: Bool?;
}

struct Wrapper {
    nested: MultiLayer;
    s: String;
}

contract StructWithOptionalLayers {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            nested: MultiLayer{l1:null,l2:null,l3:null},
            s: "test"
        };
    }
}