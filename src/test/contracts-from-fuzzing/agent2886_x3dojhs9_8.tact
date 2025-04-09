struct Layer3 {
    s: String?;
}

struct Layer2 {
    b: Bool;
    nested: Layer3;
}

struct Layer1 {
    a: Int;
    nested: Layer2;
}

contract DeepOptionals {
    val: Layer1;
    init() {
        self.val = Layer1{
            a: 4,
            nested: Layer2{ b: true, nested: Layer3{ s: null } }
        };
    }
}