struct OptInt {
    i: Int?;
}

struct Wrapper {
    o: OptInt;
}

contract NestedOpt {
    data: Wrapper?;
    init() {
        self.data = null;
    }
}