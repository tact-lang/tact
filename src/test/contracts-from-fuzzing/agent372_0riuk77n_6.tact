struct Levels3 {
    a: Int;
    b: Int;
}

struct Levels2 {
    deeper: Levels3;
    flag: Bool;
}

struct Levels1 {
    deeper: Levels2;
    maybe: Bool?;
}

contract TripleNestedStructs {
    root: Levels1;

    init() {
        self.root = Levels1{
            deeper: Levels2{deeper: Levels3{a:1,b:2}, flag:true},
            maybe: null
        };
    }
}