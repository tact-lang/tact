// struct with many optional fields and one nested struct
struct N {
    val: Int;
}

struct M {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: N?;
}

contract OptMany {
    data: M;
    init() {
        self.data = M{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}