struct ABC {
    x: Int;
    y: Bool;
    z: Int?;
}

contract DefaultedStructField {
    fld: ABC = ABC{ x: 0, y: false, z: null };
}
