struct SerOpt {
    a: Int? as uint4;
    b: Bool?;
}

contract SerOptContract {
    data: SerOpt;

    init() {
        self.data = SerOpt{ a: null, b: null };
    }
}