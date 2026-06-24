struct InnerOptional { nestedOpt: Bool?; }

contract Test {
    f1: Int?;
    f2: InnerOptional;

    init() {
        self.f1 = null;
        self.f2 = InnerOptional{ nestedOpt: true };
    }
}