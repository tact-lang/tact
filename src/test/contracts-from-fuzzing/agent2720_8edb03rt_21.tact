struct Defaults {
    a: Int = 11;
    b: Int = 22;
}

contract Test {
    d: Defaults = Defaults{ b: 33 };
}