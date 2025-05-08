struct Depth1 {
    a: Int;
}

struct Depth2 {
    b: Depth1;
}

struct Depth3 {
    c: Depth2;
}

struct Depth4 {
    d: Depth3;
}

struct Depth5 {
    e: Depth4;
}

contract DeepFiveLevels {
    data: Depth5;

    init() {
        self.data = Depth5{
            e: Depth4{
                d: Depth3{
                    c: Depth2{
                        b: Depth1{a:5}
                    }
                }
            }
        };
    }
}