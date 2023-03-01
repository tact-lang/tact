primitive Int;
primitive Bool;

contract Contract {
    value: Int;
    init(arg: Bool) {
        if (arg) {
            // Nothing
        } else {
            self.value = 1;
        }
    }
}