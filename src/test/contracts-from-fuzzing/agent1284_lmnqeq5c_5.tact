struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

contract TestContract {
    middle: Middle = Middle{ inner: InnerMost{ val: 123 } };
}