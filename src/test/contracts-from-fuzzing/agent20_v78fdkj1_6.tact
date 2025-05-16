struct InnerMost {
    val: Int?;
}

struct Middle {
    foo: InnerMost;
}

struct OuterMost {
    data: Middle;
}

contract DeepOptionalsNested {
    composed: OuterMost = OuterMost{data: Middle{foo: InnerMost{val: null}}};

    receive() {
        self.composed = OuterMost{data: Middle{foo: InnerMost{val: 5}}};
    }
}