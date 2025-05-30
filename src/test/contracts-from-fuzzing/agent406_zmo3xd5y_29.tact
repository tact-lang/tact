struct Stage1 {
    x: Int;
}
struct Stage2 {
    y: Stage1;
}
struct Stage3 {
    z: Stage2;
}
struct Stage4 {
    q: Stage3;
}

contract DeepFields {
    f: Stage4;
    init() {
        self.f = Stage4 {
            q: Stage3{
                z: Stage2{
                    y: Stage1{
                        x: 44
                    }
                }
            }
        };
    }
}