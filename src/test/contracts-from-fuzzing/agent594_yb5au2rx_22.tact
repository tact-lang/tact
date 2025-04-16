struct Points {
    p1: Int as uint8;
    p2: Int as uint8;
    p3: Int as uint8;
    p4: Int as uint8;
    p5: Int as uint8;
}

contract PackedStorageContract {
    points: Points = Points{
        p1: 1, p2: 2, p3: 3, p4: 4, p5: 5
    };
}