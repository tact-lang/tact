struct Sizer {
    tiny: Int as uint1;
    big: Int as int257;
}

contract IntRangeStorage {
    data: Sizer;

    init() {
        self.data = Sizer{ tiny: 1, big: -123456789 };
    }
}