struct ComboOptional {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    nest: Nested?;
}

struct Nested {
    val: Int;
}

contract OptionalWithNested {
    f: ComboOptional;

    init() {
        self.f = ComboOptional{
            v1:null, v2:null, v3:null, nest:null
        };
    }
}
