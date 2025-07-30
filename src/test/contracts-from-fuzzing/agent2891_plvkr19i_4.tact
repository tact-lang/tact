struct Points {
    p1: Int;
    p2: Int;
    p3: Int;
    p4: Int;
    p5: Int;
    p6: Int;
    p7: Int;
    p8: Int;
    p9: Int;
    p10: Int;
}

contract WideStructTest {
    data: Points;
    init() {
        self.data = Points{
            p1:1,p2:2,p3:3,p4:4,p5:5,p6:6,p7:7,p8:8,p9:9,p10:10
        };
    }
}