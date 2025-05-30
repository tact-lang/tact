struct Inner {
    innerVal: Int;
    innerFlag: Bool?;
}

struct Middle {
    midVal: Int;
    nested: Inner;
}

contract NestTest {
    deep: Middle;

    init() {
        self.deep = Middle{
            midVal: 1,
            nested: Inner{ innerVal: 2, innerFlag: true },
        };
    }
}