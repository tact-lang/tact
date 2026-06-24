struct MultiLevel {
    level1: Int;
    level2: Int;
}

struct MiddleWrap {
    innerMulti: MultiLevel;
}

struct OuterWrap {
    middle: MiddleWrap;
}

contract MultilevelNesting {
    val: OuterWrap;
    init() {
        self.val = OuterWrap{middle: MiddleWrap{innerMulti: MultiLevel{level1:1, level2:2}}};
    }
}