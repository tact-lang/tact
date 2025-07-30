struct Data {
    val: Int as uint32;
}

struct Wrapper {
    data: Data?;
}

contract TestC {
    w: Wrapper;

    init() {
        self.w = Wrapper{ data: Data{ val: 123456 } };
    }
}