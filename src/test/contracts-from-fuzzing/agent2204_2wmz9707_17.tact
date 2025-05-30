struct OuterOne {
    middle: InnerOne;
}

struct InnerOne {
    innermost: InnermostOne;
}

struct InnermostOne {
    flag: Bool;
    val: Int;
}

contract DeepChain {
    outer: OuterOne;
    init() {
        self.outer = OuterOne{
            middle: InnerOne{
                innermost: InnermostOne{ flag: false, val: 55 }
            }
        };
    }
}