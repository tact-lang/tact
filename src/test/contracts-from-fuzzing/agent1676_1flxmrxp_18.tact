struct Level3 { f: Int?; }
struct Level2 { c: Int; d: Level3; }
struct Level1 { a: Level2; b: Level2; }

contract MultiNestedOptional {
    root: Level1;
    init() {
        self.root = Level1{
            a: Level2{c:1,d:Level3{f:null}},
            b: Level2{c:2,d:Level3{f:3}}
        };
    }
}