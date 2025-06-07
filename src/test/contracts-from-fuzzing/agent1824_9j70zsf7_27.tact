// Optional primitive fields with serialization annotations
struct OptionalSer {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalSerFields {
    data: OptionalSer;

    init() {
        self.data = OptionalSer{ a:null, b:null, s:null };
    }
}
