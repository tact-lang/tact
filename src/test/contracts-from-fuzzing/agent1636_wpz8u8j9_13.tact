struct Points {
    x: Int as int64;
    y: Int as int64;
}

contract PointsTest {
    first: Points;
    second: Points;

    init() {
        self.first = Points{x:1,y:2};
        self.second = Points{x:3,y:4};
    }
}
