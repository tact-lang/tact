struct Mixed {
    n: Int as int64 = 123;
    flag: Bool?;
    text: String = "txt";
}

struct WithNested {
    m: Mixed?;
    val: Int? as uint32;
}

contract ComboNest {
    s: WithNested = WithNested{};
    receive() {}
}