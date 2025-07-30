struct Level3 {
    a: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract Test {
    receive() {}
    
    // Getter returning a deeply nested structure
    get fun getNested(): Level1 {
         return Level1 { lvl2: Level2 { lvl3: Level3 { a: 99 } } };
    }
}
