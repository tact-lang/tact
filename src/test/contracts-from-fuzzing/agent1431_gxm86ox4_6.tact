struct InnerMost { x: Int; }
struct Middle { innerMost: InnerMost; }

contract DeepDefaults {
    middle: Middle = Middle{ innerMost: InnerMost{ x: 42 } };
}
