message(0x1) InnerM { x: Int; }
message(0x2) OuterM { inner: InnerM?; }

contract OptMsgNest {
    m: OuterM = OuterM{ inner: null };
}