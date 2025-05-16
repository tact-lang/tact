struct Layers1 {
    x: Int?;
}

struct Layers2 {
    l: Layers1;
}

struct Layers3 {
    l: Layers2;
}

contract DeepOptionalNesting {
    val: Layers3;

    init() {
        self.val = Layers3{ l: Layers2{ l: Layers1{ x:null } } };
    }
}