struct WrapperOptional {
    s: OptionalInner;
}

struct OptionalInner {
    x: Int?;
    y: Int?;
}

contract TestContract {
    w: WrapperOptional;

    init() {
        self.w = WrapperOptional{
            s: OptionalInner{
                x:null, y:null
            }
        };
    }
}