struct NestedOne {
    inner: Int;
}

struct NestedTwo {
    one: NestedOne;
}

struct NestedThree {
    two: NestedTwo;
}

struct NestedFour {
    three: NestedThree;
}

contract Layered {
    data: NestedFour;

    init() {
        self.data = NestedFour{
            three: NestedThree{
                two: NestedTwo{
                    one: NestedOne{ inner: 5 }
                }
            }
        };
    }
}