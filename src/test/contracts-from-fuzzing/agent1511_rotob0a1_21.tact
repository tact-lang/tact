struct BigNestedWithStrings {
    part1: PartA;
    part2: PartB;
}

struct PartA {
    intVal: Int;
    msg: String;
}

struct PartB {
    optBool: Bool?;
    text: String;
}

contract ComplexNested {
    top: BigNestedWithStrings;

    init() {
        self.top = BigNestedWithStrings{
            part1: PartA{
                intVal: 123,
                msg: "foo"
            },
            part2: PartB{
                optBool: null,
                text: "bar"
            }
        };
    }
}
