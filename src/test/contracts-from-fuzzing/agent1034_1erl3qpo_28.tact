struct InnerMost { val: Int; }
struct Middle { inner: InnerMost?; }
struct Top { middle: Middle; }

contract DeepMiddleOptional {
    top: Top = Top{
        middle: Middle{ inner: null }
    };
}