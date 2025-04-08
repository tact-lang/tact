struct OptionalSerialize {
    a: Int? as int32;
    b: Bool?;
    c: String?;
}

contract OptSerDefaults {
    os: OptionalSerialize;

    init() {
        self.os = OptionalSerialize{
            a:null,b:null,c:null
        };
    }
}