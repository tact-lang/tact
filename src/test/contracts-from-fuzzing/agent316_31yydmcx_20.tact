struct SerOpt {
    foo: Int? as uint4;
    bar: Int? as int16;
}

contract TestSerOpt {
    data: SerOpt;

    init() {
        self.data = SerOpt{ foo: null, bar: -5 };
    }
}