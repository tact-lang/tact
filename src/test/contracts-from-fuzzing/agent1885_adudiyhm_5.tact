struct NestedMany {
    one: Level1;
}

struct Level1 {
    two: Level2;
    b: Bool;
}

struct Level2 {
    three: Level3;
    s: String;
}

struct Level3 {
    val1: Int;
    val2: Int?;
    val3: Bool?;
}

contract RecursiveLike {
    nested: NestedMany;

    init() {
        self.nested = NestedMany{
            one: Level1{
                two: Level2{
                    three: Level3{
                        val1: 7,
                        val2: null,
                        val3: true
                    },
                    s: "hi"
                },
                b: false
            }
        };
    }
}