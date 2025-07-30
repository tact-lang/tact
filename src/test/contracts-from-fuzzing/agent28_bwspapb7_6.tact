struct L2 {i: Int; s: String; }

contract TestContract {
    nestedOptional: L2?;

    init() {
        self.nestedOptional = L2{ i: 10, s: "hello" };
    }
}
