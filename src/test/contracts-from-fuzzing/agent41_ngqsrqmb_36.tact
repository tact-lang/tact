// Contract with nested combination of optionals and defaults, with serialization annotations
struct AnnStruct {
    a: Int? as uint8;
    b: Bool?;
    s: String?;
}

contract AnnOptDefaults {
    val: AnnStruct;
    init() {
        self.val = AnnStruct{
            a: null,
            b: null,
            s: null,
        };
    }
}