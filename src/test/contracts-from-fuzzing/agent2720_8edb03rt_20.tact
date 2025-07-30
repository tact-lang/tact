struct Defaults {
    a: Int = 10;
    b: Int = 20;
}

contract Test {
    d: Defaults = Defaults{ a:1, b:2 };
}