message(0x42) MMsg {
    val: Int = 42;
    flag: Bool = false;
}

struct ComboStruct {
    s: String = "hi";
    n: Int = 7;
}

contract ComboAll {
    x: Int = 1;
    y: Bool = true;
    m: MMsg = MMsg{};
    s: ComboStruct = ComboStruct{};
}