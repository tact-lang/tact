struct Level3 {
    z: Int as int64;
    note: String?;
}

struct Level2 {
    midVal: Int as uint32;
    l3: Level3;
    extra: Bool?;
}

struct Level1 {
    top: Int as int16;
    l2: Level2;
    flag: Bool?;
    label: String?;
}

contract DeepNested {
    data: Level1;

    init() {
        self.data = Level1{
            top: -5,
            l2: Level2{
                midVal: 12345,
                l3: Level3{
                    z: 999,
                    note: "hi"
                },
                extra: true
            },
            flag: false,
            label: "deep"
        };
    }

    receive() {}
}