struct ManyFields {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "a";
    f4: Int = 4;
    f5: Bool = true;
    f6: String = "b";
    f7: Int = 7;
    f8: Bool = false;
    f9: String = "c";
    f10: Int = 10;
}

contract ManyStructFields {
    data: ManyFields = ManyFields{};
}