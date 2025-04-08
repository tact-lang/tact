contract MidLayerOptional {
    mid: Bool?;
    top: Int;

    init() {
        self.mid = null;
        self.top = 3;
    }
}