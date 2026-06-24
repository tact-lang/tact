struct BigStruct {
    f1: Int = 0;
    f2: Bool = false;
    f3: Int = 1;
    f4: Bool = true;
    f5: Int = 2;
    f6: Bool = false;
    f7: Int = 3;
    f8: Bool = true;
    f9: Int = 4;
    f10: Bool = false;
}

contract BigStructContract {
    val: BigStruct;

    init() {
        self.val = BigStruct{};
    }

    receive() {}
}