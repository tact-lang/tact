struct Level2 {
    num: Int;
    txt: String;
    opt: Bool?;
}

struct Level1 {
    flag: Bool;
    nested: Level2;
}

contract TestContract {
    storage: Level1;
    
    init() {
        self.storage = Level1{
            flag: true,
            nested: Level2{num: 42, txt: "deep", opt: null}
        };
    }
}