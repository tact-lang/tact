trait HasBoolField {
    flag: Bool;
}

contract NullabilityTrait with HasBoolField {
    flag: Bool;
    init() {
        self.flag = false;
    }
    receive() {
        let _ = self.flag;
    }
}