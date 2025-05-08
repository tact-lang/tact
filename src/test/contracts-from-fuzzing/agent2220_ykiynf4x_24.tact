struct Mixed {
    x: Int?;
    y: String? = null;
    z: Int = 42;
}

contract Test {
    f: Mixed = Mixed{ z: 55 };
}