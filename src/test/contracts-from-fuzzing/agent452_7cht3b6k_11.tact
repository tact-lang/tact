struct Level3 { z: Int; optFlag: Bool?; }
struct Level2 { y: Level3; str: String; }
struct Level1 { x: Level2; intOpt: Int?; }

contract Test11 {
    data: Level1;
    init() {
        self.data = Level1{
            x: Level2{
                y: Level3{ z: -99, optFlag: null },
                str: "nested"
            },
            intOpt: 12345
        };
    }
}
