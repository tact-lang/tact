struct DefStruct {
    ok: Bool = true;
    txt: String = "abcd";
}

contract OptDefStructTest {
    s: DefStruct? = null;
    init() {}
}