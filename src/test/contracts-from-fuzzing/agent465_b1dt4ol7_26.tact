// Now test persistent storage with optional primitives and composite side-by-side
struct Inner {
    x: Int;
}

contract TestContract {
    maybeInt: Int?;
    maybeStruct: Inner?;

    init() {
        self.maybeInt = null;
        self.maybeStruct = null;
    }
}
