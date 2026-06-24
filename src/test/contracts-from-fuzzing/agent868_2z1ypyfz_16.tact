struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

contract DeeplyNested {
    data: OuterMost = OuterMost{ middle: Middle{ inner: InnerMost{ val: 123 } } };
}