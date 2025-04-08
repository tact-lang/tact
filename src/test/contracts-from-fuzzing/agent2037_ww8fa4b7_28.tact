// large nested optional struct block
struct BottomOpt {
    val: Int?;
    flag: Bool?;
}

struct MiddleOpt {
    bottom: BottomOpt?;
    txt: String?;
}

struct TopOpt {
    middle: MiddleOpt?;
    counter: Int;
}

contract LargeNestedOptional {
    big: TopOpt;

    init() {
        self.big = TopOpt{
            middle: MiddleOpt{
                bottom: BottomOpt{
                    val: null,
                    flag: null
                },
                txt: null
            },
            counter: 123
        };
    }
}
