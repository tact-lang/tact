message InnerMsg { z: Int }
struct Combined {
    nested: InnerMsg;
    val: Int;
}
contract MsgInsideStruct {
    combined: Combined = Combined{ nested: InnerMsg{z:1}, val:42 };
}