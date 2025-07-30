struct Data {
    val1: Slice?;
    val2: Cell?;
}

contract TestContract {
    storage: Data;

    init() {
        self.storage = Data{
            val1: null,
            val2: null
        };
    }
}