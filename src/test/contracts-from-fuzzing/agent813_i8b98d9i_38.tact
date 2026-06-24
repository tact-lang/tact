struct SDefaultOpt {
    x: Int?;
    y: Bool?;
}

contract InitPartialOptional {
    data: SDefaultOpt;

    init() {
        self.data = SDefaultOpt{ x: null, y: true };
    }
}