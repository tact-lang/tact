// Persistent nested struct initialized partially via defaults, partially via init assignment
struct B {
    s: String = "hello";
    n: Int;
}

contract PartialNestedInit {
    b: B;

    init() {
        self.b = B{ n: 42 };
    }
}