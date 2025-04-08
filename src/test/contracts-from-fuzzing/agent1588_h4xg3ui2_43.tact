message EmptyMsg {}

struct Wrapper {
    m: EmptyMsg?;
}

contract DeepOptionalMsg {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            m: null
        };
    }
}