struct Level3 {
    leaf: String?;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    mid: Level2;
    count: Int;
}

contract DeepNested {
    data: Level1 = Level1{
        mid: Level2{
            inner: Level3{ leaf: null },
            flag: false
        },
        count: 10
    };

    receive() {
        self.data = self.data;
    }
}