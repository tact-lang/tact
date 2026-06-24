struct Level5 {
    f: Int;
}

struct Level4 {
    inner: Level5;
    f: Int;
}

struct Level3 {
    inner: Level4;
    f: Int;
}

struct Level2 {
    inner: Level3;
    f: Int;
}

struct Level1 {
    inner: Level2;
    f: Int;
}

contract TestContract {
    receive() {
        let deep: Level1 = Level1{
            inner: Level2{
                inner: Level3{
                    inner: Level4{
                        inner: Level5{ f: 50 },
                        f: 40
                    },
                    f: 30
                },
                f: 20
            },
            f: 10
        };
    }
}
