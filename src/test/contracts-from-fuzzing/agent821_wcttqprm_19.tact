// test optional struct with serialization customization inside
struct OptCustom {
    mini: Int as uint4;
    flag: Bool;
}

contract TestOptCustom {
    data: OptCustom? = null;

    init() {
        self.data = OptCustom{mini: 8, flag: true};
    }
}
