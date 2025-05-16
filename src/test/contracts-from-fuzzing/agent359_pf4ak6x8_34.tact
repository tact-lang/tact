message(0x10) InnerMsg { x: Int }
message(0x20) OuterMsg { inner: InnerMsg }

contract NestedMsgsInFields {
    m: OuterMsg;
    init() {
        self.m = OuterMsg{ inner: InnerMsg{ x: 5 } };
    }
}