struct ChildStruct {
    flag: Bool;
    text: String;
}

struct MultiOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: ChildStruct?;
}

contract MultiOptFields {
    storage: MultiOptional;
    
    init() {
        self.storage = MultiOptional{
            a: null,
            b: "sample",
            c: true,
            d: null,
        };
    }
}
