struct Layer {
    lv1: Int;
    lv2: Bool?;
    lv3: String?;
}

contract OptFields {
    persist1: Layer?;
    persist2: Layer?;

    init() {
        self.persist1 = null;
        self.persist2 = null;
    }
}