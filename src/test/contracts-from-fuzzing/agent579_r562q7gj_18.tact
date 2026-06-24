struct Sized {
    smallNum: Int as uint32;
    bigNum: Int;
}

contract OptSizedStorage {
    record: Sized?;

    init() {
        self.record = Sized{
            smallNum: 123456,
            bigNum: -99999
        };
    }
}