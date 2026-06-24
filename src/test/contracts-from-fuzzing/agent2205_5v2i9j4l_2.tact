struct Layer2 {
    val2: Int = 2;
}

struct Layer1 {
    nested: Layer2;
}

contract DeepStorage {
    state: Layer1;

    init() {
        self.state = Layer1{
            nested: Layer2{val2: 10}
        };
    }
}