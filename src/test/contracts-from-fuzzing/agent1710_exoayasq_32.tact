// Contract field of deeply nested nested nested struct with different types + defaults
struct L3 { a: Int = 5; b: Bool = false; c: String? = null }
struct L2 { lvl3: L3 = L3{}; flag: Bool }

contract Test {
    nested: L2;

    init() {
        self.nested = L2{ lvl3: L3{ a:10, b:true, c:null }, flag:true };
    }
}