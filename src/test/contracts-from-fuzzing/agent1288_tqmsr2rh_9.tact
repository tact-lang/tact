struct SizedStruct {
    small: Int as uint8;
    mid: Int as int16;
    isOk: Bool;
}

struct Wrapper {
    info: SizedStruct;
    flag: Bool;
}

contract TestContract {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            info: SizedStruct{
                small: 7,
                mid: -12345,
                isOk: true
            },
            flag: false
        };
    }
}