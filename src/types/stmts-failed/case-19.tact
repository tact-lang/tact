primitive Int;
primitive Bool;

trait BaseTrait {
    
}

contract Contract {
    value: Int;
    value2: Int;
    init(arg: Bool) {
        self.value = self.value2 + 1;
        self.value2 = 10;
    }
}