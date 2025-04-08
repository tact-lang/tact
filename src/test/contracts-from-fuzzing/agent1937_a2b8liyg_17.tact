contract SerializationEdge {
    small1: Int as uint4;
    small2: Int as uint8;
    small3: Int as uint12;
    small4: Int as uint20;

    init() {
        self.small1 = 1;
        self.small2 = 2;
        self.small3 = 3;
        self.small4 = 4;
    }
}
