struct Level3 { 
    a: Int?; 
    b: Bool; 
} 

struct Level2 { 
    c: Level3?; 
    d: Cell; 
} 

struct Level1 { 
    e: Level2?; 
    f: Slice; 
} 

contract NestedOptionals {
    packed: Level1;
    init() {
        self.packed = Level1{
            e: null,
            f: emptyCell().asSlice(),
        };
    }
}