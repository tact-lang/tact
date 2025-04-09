// Test optional of struct
struct Mini {
    x: Int;
}

contract OptStruct {
    f: Mini?;

    init() {
        self.f = null;
    }
}