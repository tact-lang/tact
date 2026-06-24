contract ConstantsVsVars {
    const x: Int = 10;
    const y: Bool = true;

    z: Int;
    w: Bool;

    init() {
        self.z = self.x + 5;
        self.w = self.y;
    }
}