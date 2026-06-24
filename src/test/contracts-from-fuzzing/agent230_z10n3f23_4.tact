struct Child {
    z: Int?;
}

contract OptionalNestedField {
    child: Child;

    init() {
        self.child = Child {
            z: null
        };
    }
}
