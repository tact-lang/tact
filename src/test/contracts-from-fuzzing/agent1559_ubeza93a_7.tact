struct NestOpt {
    a: Int;
    b: String?;
    c: Bool;
}

contract NestedOptionInField {
    data: NestOpt;

    init() {
        self.data = NestOpt{ a: 5, b: null, c: false };
    }
}