struct Level5 {
    value: Int as uint8;
}

struct Level4 {
    nested: Level5;
}

struct Level3 {
    nested: Level4;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestDeepNested {
    receive() {
        let chain = Level1 {
            nested: Level2 {
                nested: Level3 {
                    nested: Level4 {
                        nested: Level5 { value: 42 }
                    }
                }
            }
        };
        dump(chain.nested.nested.nested.nested.value);
    }
}
