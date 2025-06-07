struct Weird {
    f1: Int as int1;
    f2: Int as uint1;
    f3: Int as int257;
    f4: Int as uint256;
}

contract SerializationEdges {
    s: Weird;

    init() {
        self.s = Weird{
            f1: 1,
            f2: 1,
            f3: 0,
            f4: 0,
        };
    }
}