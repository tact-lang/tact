struct FlattenOpt {
    val1: Int?;
    val2: Bool?;
}

contract FlatOptAll {
    f: FlattenOpt?;

    init() {
        self.f = null;
    }
}