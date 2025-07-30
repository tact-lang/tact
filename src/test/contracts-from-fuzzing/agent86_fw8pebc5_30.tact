// optional tuple-like struct
struct PointOpt {
    x: Int?;
    y: Int?;
}

contract C {
    pt: PointOpt;

    init() {
        self.pt = PointOpt{
            x: null,
            y: null,
        };
    }
}