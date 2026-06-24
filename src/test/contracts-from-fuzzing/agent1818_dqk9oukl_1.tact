struct DeepNested {
    a: Level1;
}

struct Level1 {
    b: Level2;
    c: Int;
}

struct Level2 {
    d: Level3;
    e: Int?; 
}

struct Level3 {
    f: Bool;
    g: Level4;
}

struct Level4 {
    h: String;
    i: Bool;
}

contract DeepTest {
    testField: DeepNested;

    init() {
        self.testField = DeepNested{
            a: Level1{
                b: Level2{
                    d: Level3{
                        f: true,
                        g: Level4{
                            h: "hi",
                            i: false
                        }
                    },
                    e: null
                },
                c: 7
            }
        };
    }
}
