message(100) InnerMsg {}
message(101) OuterMsg { inner: InnerMsg; }

contract NestedMsgField {
    m: OuterMsg = OuterMsg{ inner: InnerMsg{} };
}