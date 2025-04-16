struct OptionalStruct {
    p: Int?;
    q: Bool?;
    s: String?;
}

contract Test4 {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{
            p: null,
            q: true,
            s: null,
        };
    }
}