struct Level1 {
    flag: Bool;
    nested: Level2?;
}
struct Level2 {
    text: String?;
}

contract NestedOptWithinOpt {
    data: Level1;

    init() {
        self.data = Level1{
            flag:true,
            nested: Level2{text:null}
        };
    }
}