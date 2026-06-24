// Test empty optional struct as top-level field
struct EmptyOptStruct {
    field1: Int;
}

contract TestContract {
    maybeEmpty: EmptyOptStruct?;

    init() {
        self.maybeEmpty = null;
    }
}
