struct Overwrite {
    a: Int = 13;
    b: Int = 27;
}

contract W {
    f: Overwrite = Overwrite{ a: 1, b: 2 };
}
