struct Level3 {
    bottomInt: Int;
    bottomBool: Bool?;
    bottomString: String;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
    optionalL3: Level3?;
}

struct Level1 {
    l2: Level2;
    str: String;
}

contract DeepWideNested {
    a: Level1;
    b: Level1;

    init() {
        let l3inst = Level3{
            bottomInt: 777,
            bottomBool: null,
            bottomString: "deepest",
        };
        let l2inst = Level2{
            l3a: l3inst,
            l3b: l3inst,
            optionalL3: null,
        };
        let l1inst = Level1{
            l2: l2inst,
            str: "hi",
        };
        self.a = l1inst;
        self.b = l1inst;
    }

    receive() {}
}