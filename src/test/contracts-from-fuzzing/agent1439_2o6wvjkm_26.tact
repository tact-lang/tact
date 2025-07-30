struct HasBool {
    b: Bool;
}

struct MaybeBool {
    m: HasBool?;
}

contract OptBool {
    f: MaybeBool;
    init() {
        self.f = MaybeBool{ m: HasBool{b:true} };
    }
}