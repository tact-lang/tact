struct Level2 {
    flag: Bool;
    label: String;
}

struct Level1 {
    inner1: Level2;
    inner2: Level2;
}

contract NestedDup {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner1: Level2{flag:true,label:"x"},
            inner2: Level2{flag:false,label:"y"},
        };
    }
}