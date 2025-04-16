struct DefStruct {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultStructTest {
    s: DefStruct = DefStruct{};
}