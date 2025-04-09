struct Deep { x: Int; y: Bool }

contract OptStructField {
    maybeDeep: Deep?;

    init() {
        self.maybeDeep = Deep{ x: 42, y: true };
    }
}