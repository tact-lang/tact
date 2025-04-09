// Test long nested chain of structs with many primitive fields
struct G1 {
    a: Int;
    b: Bool;
}

struct G2 {
    inner: G1;
    c: String;
}

struct G3 {
    inner2: G2;
    d: Address;
}

contract DeepStructs {
    store: G3;

    init() {
        self.store = G3{
            inner2: G2{
                inner: G1{ a: 1, b: true },
                c: "hi",
            },
            d: myAddress(),
        };
    }
}