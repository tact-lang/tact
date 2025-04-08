// Test contract field initialized by message struct instance
message(77) M { v: Int }

contract TestContract {
    m: M;

    init() {
        self.m = M { v: -42 };
    }
}