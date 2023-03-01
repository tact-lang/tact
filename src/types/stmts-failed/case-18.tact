primitive Int;
primitive Bool;

contract Contract {
    value: Int;
    init(arg: Bool) {
        if (arg) {
            self.value = 1;
        } else if (!arg) {
            self.value = 1;
        }
    }
}