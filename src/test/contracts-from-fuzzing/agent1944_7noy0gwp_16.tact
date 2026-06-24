struct Level3 {
    y: Int;
}

struct Level2 {
    z: Bool;
    lvl3: Level3;
}

struct Level1 {
    w: String;
    lvl2: Level2;
}

contract MultiDeepNested {
    deep: Level1;

    init() {
        self.deep = Level1{
            w:"x",
            lvl2: Level2{z:true,lvl3:Level3{y:5}}
        };
    }
}