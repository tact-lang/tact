contract TinyHugeSerialization {
    smallest: Int as uint1;
    biggest: Int as int257;
    init() {
        self.smallest = 1;
        self.biggest = 123456789;
    }
}