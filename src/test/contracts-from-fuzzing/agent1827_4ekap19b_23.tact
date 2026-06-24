struct StructWithDefaultAndOpt {
    x: Int = 7;
    y: Bool?;
}

contract DefaultOptMixStorage {
    item: StructWithDefaultAndOpt;

    init() {
        self.item = StructWithDefaultAndOpt { y: null };
    }
}