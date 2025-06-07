struct Leaf {
    i: Int as uint128;
    f: Bool;
    txt: String = "leaf";
    optAddr: Address?;
}

struct Level4 {
    leaf: Leaf?;
    strVal: String;
    num: Int;
}

struct Level3 {
    val: Level4;
    optInt: Int?;
}

struct Level2 {
    deeper: Level3?;
    flag: Bool = true;
}

struct Level1 {
    root: Level2;
    optStr: String?;
}

contract TestContract {
    storage: Level1;

    init() {
        self.storage = Level1{
            root: Level2{
                deeper: null,
                flag: false
            },
            optStr: null
        };
    }
}