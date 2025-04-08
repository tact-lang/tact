struct SerializeOverflow2 {
    tiny: Int as uint4;
}

contract SerializeOverflow2Contract {
    data: SerializeOverflow2;

    init() {
        self.data = SerializeOverflow2{
            tiny: 16,
        };
    }

    receive() {}
}