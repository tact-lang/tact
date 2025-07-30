struct ComplexNested {
    s1: Level1;
    s2: Level1?;
}

struct Level1 {
    s3: Level2;
    s4: Level2?;
}

struct Level2 {
    x: Int;
    y: Bool?;
    s5: Level3;
    s6: Level3?;
}

struct Level3 {
    a: Int;
    b: String?;
}

contract ComplexNestedTest {
    val: ComplexNested;
    init() {
        self.val = ComplexNested{
            s1: Level1{
                s3: Level2{
                    x: 1, y: true,
                    s5: Level3{ a: 2, b: "hi" },
                    s6: null
                },
                s4: null
            },
            s2: null
        };
    }
}