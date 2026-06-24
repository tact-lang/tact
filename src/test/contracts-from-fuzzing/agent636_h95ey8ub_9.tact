struct NestedBool {
    b: Bool;
}

struct NestedString {
    s: String;
}

contract NestedPrimitiveStructs {
    nb: NestedBool;
    ns: NestedString;

    init() {
        self.nb = NestedBool{ b: true };
        self.ns = NestedString{ s: "test" };
    }
}