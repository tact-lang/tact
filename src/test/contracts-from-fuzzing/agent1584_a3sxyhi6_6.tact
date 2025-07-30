struct Level2 { v: Int } 
struct Level1 { nested: Level2? } 

contract TestContract {
    data: Level1?;

    init() {
        self.data = Level1{ nested: null };
    }
}