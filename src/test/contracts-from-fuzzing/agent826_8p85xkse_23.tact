message Inner { v: Int; }
message Outer { i: Inner; }

contract TestContract {
    data: Outer? = null;

    init() {
        self.data = Outer{ i: Inner{ v: 42 } };
    }
}
