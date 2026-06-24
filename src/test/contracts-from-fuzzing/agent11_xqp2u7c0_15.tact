struct DeeplyNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
    val: Int;
}

struct Nested2 {
    level3: Nested3;
    flag: Bool;
}

struct Nested3 {
    s: String;
    addr: Address;
}

contract LongDeepNest {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        s: "hello",
                        addr: myAddress()
                    },
                    flag: true
                },
                val: 999
            }
        };
    }
}