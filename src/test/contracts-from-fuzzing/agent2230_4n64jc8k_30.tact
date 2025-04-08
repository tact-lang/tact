// optional of a struct which has optional primitive fields that default to null
struct OptPrims {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptNulls {
    val: OptPrims?;
    init() {
        self.val = null;
    }
}