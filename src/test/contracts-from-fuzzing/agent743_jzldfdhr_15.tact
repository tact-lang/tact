struct BigInts {
    big1: Int as int257;
    big2: Int as int257;
}

contract HugeInit {
    data: BigInts;

    init() {
        self.data = BigInts{
            big1: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,
            big2: -0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        };
    }
}