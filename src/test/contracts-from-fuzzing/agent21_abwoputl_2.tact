struct Data { val: Int; }

contract OptStruct {
    info: Data?;

    init() {
        self.info = null;
    }
}
