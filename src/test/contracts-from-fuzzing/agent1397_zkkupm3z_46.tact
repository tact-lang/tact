// struct with multiple nested optionals
struct SA { val: Int?; }
struct SB { sa: SA?; }
struct SC { sb: SB?; }

contract OptChain {
    data: SC;

    init() {
        self.data = SC{ sb: null };
    }
}