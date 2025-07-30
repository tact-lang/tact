struct Nested { a: Int; b: Bool; c: String }

contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "hello";
    val4: Nested = Nested{ a: 10, b: false, c: "world" };
    
    init() {
        self.val1 = 2;
        self.val2 = false;
        self.val3 = "changed";
        self.val4 = Nested{ a: 20, b: true, c: "changed again" };
    }
}