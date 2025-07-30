struct S1 { a: Int; b: Bool; c: Int?; }
struct S2 { d: Address; e: String; f: S1; }

contract NestedStructs {
    val: S2;

    init() {
        self.val = S2{
            d: myAddress(),
            e: "xxx",
            f: S1{ a: 10, b: true, c: null }
        };
    }
}