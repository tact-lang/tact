struct Data {
    a: Int as int64;
    b: Int? as uint32;
    c: Int as int257;
}

contract TestContract {
    d: Data;

    init() {
        self.d = Data{
            a: -1,
            b: null,
            c: 0
        };
    }
}