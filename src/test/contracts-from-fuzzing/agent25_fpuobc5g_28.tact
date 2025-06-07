// nested struct with both optional and non optional fields
struct Nested {
    i: Int;
    j: Int?;
    k: String;
    m: Bool?;
}
contract Test {
    n: Nested;
    init() {
        self.n = Nested{ i:1, j:null, k:"abc", m:true };
    }
}