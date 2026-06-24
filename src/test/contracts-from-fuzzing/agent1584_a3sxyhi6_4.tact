struct Level3 { val3: Int }
struct Level2 { nested3: Level3; flag: Bool }
struct Level1 { nested2: Level2; txt: String }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested2: Level2{
                nested3: Level3{ val3: 99 },
                flag: true
            },
            txt: "deep"
        };
    }
}