// Contract storage with optional struct containing an optional field
struct Inner {
    x: Int?;
}

contract TestContract {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}