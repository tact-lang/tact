struct Level1 { f1: Int; opt1: Bool?; s1: String; }
struct Level2 { l1: Level1; opt2: String?; }
struct Level3 { l2: Level2; flag: Bool; s3: String; }
struct Level4 { l3: Level3; n: Int; str: String?; }

contract TestContract {
    state: Level4;

    init() {
        self.state = Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{
                        f1: 77,
                        opt1: null,
                        s1: "deep",
                    },
                    opt2: "opt",
                },
                flag: true,
                s3: "str",
            },
            n: 123,
            str: null,
        };
    }
}