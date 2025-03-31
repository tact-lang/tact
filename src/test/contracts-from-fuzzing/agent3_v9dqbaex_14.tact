struct Level1 {
    a: Int;
    b: String;
}

struct Level2 {
    l1: Level1;
    c: Bool;
}

contract TestDeepNested {
    nested: Level2 = Level2 { l1: Level1 { a: 10, b: "deep" }, c: true };

    receive() {}

    get fun getNested(): Level2 {
         return self.nested;
    }
}
