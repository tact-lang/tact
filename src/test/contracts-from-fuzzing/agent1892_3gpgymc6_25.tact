struct SerializeOpts {
    i: Int as int64;
    b: Bool;
    s: String;
    oi: Int?;
    os: String?;
}

contract SerializeMix {
    data: SerializeOpts;
    
    init() {
        self.data = SerializeOpts{
            i: 999,
            b: true,
            s: "hello",
            oi: null,
            os: null,
        };
    }
}