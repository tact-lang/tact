struct BigNested {
    level: Int;
    sub: BigNestedSub;
}

struct BigNestedSub {
    flag: Bool;
    sub2: BigNestedSub2;
}

struct BigNestedSub2 {
    data: String;
    cellVal: Cell;
    numVal: Int;
}

contract BiggerNestTest {
    data: BigNested;

    init() {
        self.data = BigNested{
            level: 1,
            sub: BigNestedSub{
                flag: true,
                sub2: BigNestedSub2{
                    data: "hello",
                    cellVal: emptyCell(),
                    numVal: 99
                }
            }
        };
    }
}