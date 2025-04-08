contract IntSerialization {
    small1: Int as int1;
    small2: Int as int8;
    large1: Int as int257;

    init() {
        self.small1 = 0;
        self.small2 = 127;
        self.large1 = 123456789;
    }
}