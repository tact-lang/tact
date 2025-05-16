message(99) InnerM {
    q: Int = 9;
}

struct OuterS {
    im: InnerM?;
}

contract OptMsgNested {
    s: OuterS?;
}