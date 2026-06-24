struct InnerMost { x: Int; }
struct Middle { innerMost: InnerMost; }

contract DeepInit {
    middle: Middle;

    init() {
        self.middle = Middle{ innerMost: InnerMost{ x: 99 } };
    }
}
