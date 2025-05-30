// Nested struct with some explicit defaults
struct Nester {
    one: Int = 1;
    two: Bool = false;
    three: String;
}

contract StoreNester {
    val: Nester;
    
    init() {
        self.val = Nester{
            three: "missing"
        };
    }
}