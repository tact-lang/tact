struct Level2 {
    val: Int;
}

struct Level1 {
    inner: Level2?;
    flag: Bool;
}

contract MixedNestOpt {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{val: 99},
            flag: false
        };
    }
}