struct One {
    a: Int;
}
struct Two {
    x: One;
}
struct Three {
    y: Two;
}
struct Four {
    z: Three;
}

contract ManyLevels {
    val: Four;

    init() {
        self.val = Four{
            z: Three{
                y: Two{
                    x: One{
                        a: 42
                    }
                }
            }
        };
    }
}