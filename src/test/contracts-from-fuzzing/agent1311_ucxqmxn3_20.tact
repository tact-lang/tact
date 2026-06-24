struct SerialAtEdge {
    big: Int as int257;
    small: Int as int1;
}

contract TestContract {
    data: SerialAtEdge;

    init() {
        self.data = SerialAtEdge{
            big: 123,
            small: 1,
        };
    }
}
