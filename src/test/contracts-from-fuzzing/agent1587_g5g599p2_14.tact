struct Level4 { num: Int; opt: String?; }
struct Level3 { child: Level4; name: String; }
struct Level2 { inner: Level3; flag: Bool; }
struct Level1 { wrapper: Level2; count: Int; }

contract VeryDeep {
    data: Level1;

    init() {
        self.data = Level1{
            wrapper: Level2{
                inner: Level3{
                    child: Level4{
                        num: 123,
                        opt: null
                    },
                    name: "deep"
                },
                flag: true
            },
            count: 5
        };
    }
}