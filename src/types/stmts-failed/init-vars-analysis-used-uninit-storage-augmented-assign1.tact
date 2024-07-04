primitive Int;

trait BaseTrait { }

contract Contract {
    value: Int;
    init() {
        self.value = self.value + 1;
    }
}