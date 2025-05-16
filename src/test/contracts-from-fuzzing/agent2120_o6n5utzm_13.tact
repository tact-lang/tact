struct DeeplyNestedOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Wrapper {
    nested: DeeplyNestedOptional?;
}

contract NestedOptionals {
    data: Wrapper;
    init() {
        self.data = Wrapper{ nested:null };
    }
}