message(201) SubMsg { v: Int; }

message(200) OuterMsg {
    inner: SubMsg?;
}

contract OptionalInnerMsg {
    m: OuterMsg = OuterMsg{};
}