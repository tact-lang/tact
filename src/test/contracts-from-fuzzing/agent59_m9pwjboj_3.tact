struct EmptyMapHolder {
    m: map<Int, Int>;
}

contract MapInStruct {
    st: EmptyMapHolder;

    init() {
        self.st = EmptyMapHolder{ m: emptyMap() };
    }
}