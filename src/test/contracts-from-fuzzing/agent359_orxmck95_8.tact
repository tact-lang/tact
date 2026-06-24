struct Level3 {
    flag: Bool;
    name: String;
}

struct Level2 {
    count: Int;
    lvl3: Level3;
}

struct Level1 {
    status: Bool?;
    lvl2: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            status: null,
            lvl2: Level2{
                count: 10,
                lvl3: Level3{ flag: true, name: "deep" }
            }
        };
    }
}