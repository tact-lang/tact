struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalNestedField {
    data: NestedOptionals = NestedOptionals{ x: null, y: null, z: null };
    receive() {}
}