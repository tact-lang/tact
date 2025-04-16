struct InnerLayer {
    f1: Bool?;
    f2: Int?;
}
struct MidLayer {
    m1: InnerLayer;
    m2: InnerLayer;
}
contract DeepOptionalWrap {
    core: MidLayer;

    init() {
        self.core = MidLayer{
            m1: InnerLayer{f1:null,f2:null},
            m2: InnerLayer{f1:null,f2:null}
        };
    }
}