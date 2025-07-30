struct Recursive1 {
    val: Int;
    nested: Recursive2;
}

struct Recursive2 {
    num: Int;
    nested: Recursive3;
}

struct Recursive3 {
    flag: Bool;
    nested: Recursive4;
}

struct Recursive4 {
    yes: Bool;
}

contract RecursiveDepth {
    data: Recursive1;

    init() {
        self.data = Recursive1 {
            val: 1,
            nested: Recursive2 {
                num: 2,
                nested: Recursive3 {
                    flag: true,
                    nested: Recursive4 { yes: false },
                }
            }
        };
    }
}