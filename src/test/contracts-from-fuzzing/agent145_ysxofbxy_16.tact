struct NestedFilledOptionals {
    sub: SubNested?;
}

struct SubNested {
    flag: Bool;
    val: Int?;
}

contract NestedFullOptionals {
    data: NestedFilledOptionals;

    init() {
        self.data = NestedFilledOptionals {
            sub: SubNested {
                flag: true,
                val: 999
            }
        };
    }
}