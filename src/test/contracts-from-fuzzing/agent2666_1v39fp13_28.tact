struct Bottom {
    x: Int;
}
struct Middle {
    y: Bottom;
}
struct Top {
    z: Middle;
}

contract SimpleNest {
    val: Top;

    init() {
        self.val = Top{
            z: Middle{
                y: Bottom{
                    x: 1
                }
            }
        };
    }
}