struct Mega {
    a1: Int = 1;
    a2: Bool = true;
    a3: String = "str";
    a4: Int = 4;
    a5: Bool = false;
    a6: String = "foo";
    a7: Int = 7;
    a8: Bool = true;
    a9: String = "bar";
    a10: Int = 10;
}

contract Test {
    meg: Mega;
    init() {
        self.meg = Mega{};
    }
}