struct Level4 {
    num: Int;
    label: String?;
}

struct Level3 {
    next: Level4;
    flag: Bool?;
}

struct Level2 {
    next: Level3;
    comment: String?;
}

contract Deep4 {
    data: Level2;

    init() {
        self.data = Level2{
            next: Level3{
                next: Level4{
                    num: 9,
                    label: "innermost"
                },
                flag: true
            },
            comment: "middle"
        };
    }

    receive() {}
}