struct Serializers {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerializeFields {
    s: Serializers;

    init() {
        self.s = Serializers{a: 5, b: 123, c: 1000};
    }
}