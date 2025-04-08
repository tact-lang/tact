struct S1 { a: String; b: Int; }
struct S2 { c: S1; d: String; e: Bool?; f: String?; }

contract NestedOptionalFields {
    val: S2;

    init() {
        self.val = S2{
            c: S1{
                a: "abc",
                b: 123
            },
            d: "def",
            e: null,
            f: null
        };
    }
}
