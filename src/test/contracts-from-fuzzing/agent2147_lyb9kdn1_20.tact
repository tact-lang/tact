struct ComboStruct {
    ai: Int = 1;
    bi: Int?;
    ci: Int as uint8 = 5;
    di: Int as int257 = -123456;
    flag: Bool = true;
    flagOpt: Bool?;
    text: String = "hi";
    textOpt: String?;
    cl: Cell?;
    sl: Slice?;
    addr: Address?;
}

contract MaxCombo {
    combo: ComboStruct = ComboStruct{};
}