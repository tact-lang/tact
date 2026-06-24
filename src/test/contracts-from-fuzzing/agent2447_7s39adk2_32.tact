message(0x1) InnerM { x: Int; }
message(0x2) OuterM { inner: InnerM; }

contract TestMsgNest {
    m: OuterM = OuterM{ inner: InnerM{ x: 1 } };
}