struct NestOpt {
    value: Int?;
    flag: Bool?;
}

contract TestContract {
    data: NestOpt;
    init() {
        self.data = NestOpt{ value: null, flag: true };
    }
}