struct Level2 { val: Int = 5; }
struct Level1 { nested: Level2?; }

contract C {
    f: Level1?; 

    init() {
        self.f = Level1{
            nested: null
        };
    }
}