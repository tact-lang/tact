struct BigStruct {
    f1: Int = 1;
    f2: Int = 2;
    f3: Bool = true;
    f4: String = "a";
    f5: String = "b";
    f6: Bool = false;
    f7: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    f8: Int = 8;
    f9: String = "c";
    f10: Bool = false;
}

contract TestContract {
    big: BigStruct = BigStruct{};

    init() {
        self.big = BigStruct{};
    }
}