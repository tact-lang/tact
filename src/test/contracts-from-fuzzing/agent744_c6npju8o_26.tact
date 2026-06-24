struct PointOpt {
    x: Int;
    y: Int;
}

struct LineOpt {
    start: PointOpt?;
    end: PointOpt?;
}

contract OptionalNestedStructs {
    line: LineOpt;

    init() {
        self.line = LineOpt{
            start: null,
            end: null,
        };
    }
}