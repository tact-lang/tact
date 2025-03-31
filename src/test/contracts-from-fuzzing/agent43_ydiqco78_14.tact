struct Level3 {
    value: String?;
}

struct Level2 {
    l3: Level3;
    count: Int;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract Test {
    // Deeply nested state variable with default initialization
    nested: Level1 = Level1 { 
        l2: Level2 { 
            l3: Level3 { value: null }, 
            count: 0 
        }, 
        flag: false 
    };

    // Unused getter function for the nested structure
    get fun getNested(): Level1 {
        return self.nested;
    }

    receive() {}
}
