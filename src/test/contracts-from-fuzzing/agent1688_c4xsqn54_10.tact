struct Zero { z: Int; }

struct One { zero: Zero; one: Int; }

struct Two { one: One; two: String; }

struct Three { two: Two; three: Bool; }

contract HighNest {
    s: Three;

    init() {
        self.s = Three{
            two: Two{
                one: One{
                    zero: Zero{ z: 0 },
                    one:1
                },
                two:"ok"
            },
            three:true
        };
    }
}