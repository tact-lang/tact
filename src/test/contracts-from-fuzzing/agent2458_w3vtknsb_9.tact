// Test optional struct containing optional primitive fields
struct Inner {
    f1: Int?;
    f2: String?;
}

struct Outer {
    optStruct: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            optStruct: Inner{
                f1: null,
                f2: null
            }
        };
    }
}