struct WrappedBool {
 flag: Bool;
}

contract NestedBoolField {
    content: WrappedBool;

    init() {
        self.content = WrappedBool{ flag: false };
    }
}