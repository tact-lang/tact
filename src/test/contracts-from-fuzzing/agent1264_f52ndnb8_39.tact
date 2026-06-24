struct Layer3 {
    val: Int;
}

struct Layer2 {
    child: Layer3;
}

struct Layer1 {
    child: Layer2;
    extra: Int;
}

contract DeepNest3 {
    data: Layer1;
    init() {
        self.data = Layer1{
            child: Layer2{ child: Layer3{ val:5 } },
            extra: 2
        };
    }
}