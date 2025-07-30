struct InnerMost { x: Int; }
struct Middle { innerMostOpt: InnerMost?; }

contract DeepOptional {
    middleOpt: Middle?;
}
