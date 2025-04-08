struct Level3 {
    title: String;
    flag: Bool;
}

struct Level2 {
    info: String;
    mid: Level3;
}

struct Level1 {
    label: String;
    inner: Level2;
}

contract DeeplyNested {
    data: Level1;

    init() {
        self.data = Level1{
            label: "L1",
            inner: Level2{
                info: "L2",
                mid: Level3{
                    title: "L3",
                    flag: true
                }
            }
        };
    }
}