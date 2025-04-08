struct Level1 {
    x: Int;
}

struct Level0 {
    child: Level1?;
}

contract OptNestedStruct {
    data: Level0;

    init() {
        self.data = Level0{
            child: null
        };
    }
}