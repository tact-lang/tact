// Deep optional chain: struct with optionals that hold optional fields
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    c: String?;
}

contract DeepOptionals {
    val: OuterOpt = OuterOpt{ inner: null, c: null };
    init() {
        self.val.inner = InnerOpt{ a: 42, b: true };
        self.val.c = "hi";
    }
}