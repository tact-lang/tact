// Contradictory explicit default with explicit init assignment
contract OverrideDefaultField {
    x: Int = 5;
    y: Int;
    z: Bool = false;

    init() {
        self.x = 99;
        self.y = 42;
        self.z = true;
    }
}