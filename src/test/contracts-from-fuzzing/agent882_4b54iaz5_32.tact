struct InnerWithOptional {
    data: String?;
}

contract StructWithInnerOptional {
    f: InnerWithOptional;

    init() {
        self.f = InnerWithOptional{ data: null };
    }
}