// Test serialization with non-defaulted nested optional struct inside optional
struct Inner {
    field: Int;
}

struct Outer {
    opt: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            opt: null
        };
    }
}