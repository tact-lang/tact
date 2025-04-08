// optional defaulting + nested struct
struct Inner {
    a: Int?;
    b: String?;
}
contract NestedDefault {
    n: Inner?;

    init() {
        self.n = null;
    }
}