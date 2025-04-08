// Optionals around nested structs
struct InnerOpt {
    x: Int?;
    s: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool?;
}

contract Test30 {
    val: OuterOpt;
    init() {
        self.val = OuterOpt{ inner: null, flag: null };
    }
}