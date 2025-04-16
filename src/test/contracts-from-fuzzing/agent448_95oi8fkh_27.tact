struct SerializeOverflow {
    tiny: Int as uint4;
}

contract SerializeOverflowContract {
    data: SerializeOverflow;

    init() {
        self.data = SerializeOverflow{
            tiny: 15,
        };
    }

    receive() {}
}