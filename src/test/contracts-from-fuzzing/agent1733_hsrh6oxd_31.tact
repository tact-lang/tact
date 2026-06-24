struct Layer1 {
    val: Int?;
}

struct Layer2 {
    inner: Layer1?;
}

struct Layer3 {
    deeper: Layer2?;
}

contract TestContract {
    d: Layer3;

    init() {
        self.d = Layer3{
            deeper: null
        };
    }
}