// Struct with many nested levels but no recursion
struct Level3 { c: Int; }
struct Level2 { b: Level3; }
struct Level1 { a: Level2; }

contract NestedLayers {
    data: Level1 = Level1{
        a: Level2{
            b: Level3{
                c: 99,
            },
        },
    };

    init() {
        self.data = self.data;
    }
    
    receive() {
        self.data = self.data;
    }
}