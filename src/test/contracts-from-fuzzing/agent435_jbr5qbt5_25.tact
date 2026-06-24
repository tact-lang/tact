// Persistent variable with explicit small serialization, but out of range in init
contract TestContract {
    a: Int as uint4;

    init() {
        self.a = 16; // out of 0..15 range, but only triggers at the end
    }
}
