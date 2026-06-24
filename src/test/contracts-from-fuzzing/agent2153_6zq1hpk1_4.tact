struct SubStruct {
    a: Int;
    b: Bool;
    c: String?;
}

struct MidStruct {
    sub: SubStruct;
    extra: Bool?;
}

contract DeepContract {
    mid: MidStruct;

    init() {
        self.mid = MidStruct{
            sub: SubStruct{ a: 123, b: false, c: null },
            extra: null
        };
    }
}
