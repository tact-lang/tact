struct Level3 { x: Int; opt: Bool?; }
struct Level2 { nested: Level3; }
struct Level1 { nested: Level2; }
contract DeepOptionalNest {
    data: Level1;
    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{ x: 7, opt: null }
            }
        };
    }
}