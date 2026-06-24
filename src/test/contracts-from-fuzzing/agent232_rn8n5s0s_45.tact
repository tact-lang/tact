struct MultiLevels {
    x: X;
}
struct X {
    y: Y;
}
struct Y {
    z: Z;
}
struct Z {
    i: Int;
    s: String;
    o: InnerOpt?;
}
struct InnerOpt {
    b: Bool;
}

contract Levels {
    m: MultiLevels;

    init() {
        self.m = MultiLevels{
            x: X{
                y: Y{
                    z: Z{ i:1, s:"a", o:null }
                }
            }
        };
    }
}