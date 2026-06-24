struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: Int?;
}

contract OptLayer {
    dat: NestedOptionals = NestedOptionals{ x: null, y: null, z: null };
}