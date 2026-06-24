struct S {
    v1: Int;
    v2: Bool?;
    v3: String;
}

contract StructInStructOpt {
    data: S?;
    init() {
        self.data = null;
    }
}