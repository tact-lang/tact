struct InnerWide {
    b1: Int = 101;
    b2: Int = 102;
    b3: Int = 103;
    b4: Int = 104;
    b5: Int = 105;
    b6: Int = 106;
    b7: Int = 107;
    b8: Int = 108;
    b9: Int = 109;
    b10: Int = 110;
}

struct OuterWide {
    ia: InnerWide = InnerWide{};
    ia2: InnerWide = InnerWide{};
    x: Int = 999;
}

contract WideNestedTest {
    top: OuterWide = OuterWide{};
}