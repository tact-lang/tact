struct LevelA {
    x: Int;
}

struct LevelB {
    x: Int;
    sub: LevelA;
}

struct LevelC {
    x: Int;
    sub: LevelB;
}

struct LevelD {
    x: Int;
    sub: LevelC;
}

contract Foo {
    foo: LevelD;

    init() {
        self.foo = LevelD{
            x:1,
            sub: LevelC{
                x:2,
                sub: LevelB{
                    x:3,
                    sub: LevelA{
                        x:4
                    }
                }
            }
        };
    }
}