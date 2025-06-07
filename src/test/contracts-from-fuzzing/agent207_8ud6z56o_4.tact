struct MaybeInner {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    optStruct: MaybeInner?;

    init() {
        self.optStruct = MaybeInner{
            x: null,
            y: true,
        };
    }
}