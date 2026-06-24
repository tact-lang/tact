struct InnerMost { v: Int; }
struct InnerOpt { im: InnerMost?; }
struct OuterOpt { io: InnerOpt?; }

contract DeepOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ io: null };
    }
}