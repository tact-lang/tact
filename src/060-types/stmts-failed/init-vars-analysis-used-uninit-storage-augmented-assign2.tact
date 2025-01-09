primitive Int;

trait BaseTrait { }

contract Contract {
    value: Int;
    init() {
        self.value += 1;
    }
}