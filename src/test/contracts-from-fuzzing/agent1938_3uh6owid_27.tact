struct SerialEdge {
    small: Int as uint1;
    big: Int as int257;
}

contract SerialEdgeTest {
    data: SerialEdge;

    init() {
        self.data = SerialEdge{ small: 1, big: -1 };
    }
}