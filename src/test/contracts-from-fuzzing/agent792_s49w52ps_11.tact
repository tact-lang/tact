struct Layer3 {
    foo: Int?;
}

struct Layer2 {
    nested: Layer3?;
}

struct Layer1 {
    nested: Layer2?;
}

contract DeepOptionals {
    val: Layer1?;

    init() {
        self.val = null;
    }
}