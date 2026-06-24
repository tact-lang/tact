struct Level1 {
    inner: Level2;
}

struct Level2 {
    inner: Level3;
}

struct Level3 {
    inner: Level4;
}

struct Level4 {
    inner: Level5;
}

struct Level5 {
    value: Int;
}

contract NestedDeep {
    storage: Level1;

    init() {
        self.storage = Level1{
            inner: Level2{
                inner: Level3{
                    inner: Level4{
                        inner: Level5{
                            value: 77,
                        },
                    },
                },
            },
        };
    }
}