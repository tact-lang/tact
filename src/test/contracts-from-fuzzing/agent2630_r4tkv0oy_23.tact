struct Tail2 {
    z: Int;
}

struct Middle2 {
    y: Tail2;
}

struct Head2 {
    x: Middle2;
}

contract DeepIndirect {
    head: Head2;

    init() {
        self.head = Head2 { x: Middle2 { y: Tail2 { z: 789 } } };
    }
}