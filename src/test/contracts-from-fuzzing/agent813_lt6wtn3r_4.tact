struct Deep {
    a: Int = 1;
    b: Bool? = null;
    c: Address? = null;
}

struct Nested {
    inner: Deep;
    flag: Bool = false;
}

contract TestContract {
    val: Nested;
    
    init() {
        self.val = Nested{ inner: Deep{} };
    }
}