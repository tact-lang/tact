// Test nested string and int default values interplay
struct DefaultsMix {
    a: Int = 1;
    b: String = "abc";
    c: Bool;
}

contract NestedDefaultsMix {
    val: DefaultsMix;

    init() {
        self.val = DefaultsMix{c:true};
    }
}
