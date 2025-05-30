struct ManyDefaults {
    a: Int = 1;
    b: Bool?;            // implicit null
    c: Bool = false;
    d: String? = "X";
    e: Int?;
    f: String = "Def";
    g: Int as uint8 = 255;
}

contract TestManyDefaults(
    md: ManyDefaults
) {
    receive() {}
}