// Very deep nested structs, partially optional chain

struct Leaf {
    x: Int;
}
struct Level3 {
    leaf: Leaf?;
}
struct Level2 {
    deep: Level3;
}
struct Level1 {
    root: Level2;
}

contract TestContract {
    val: Level1;
    init() {
        self.val = Level1{
            root: Level2{
                deep: Level3{
                    leaf: null
                }
            }
        };
    }
}