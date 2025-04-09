struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct Wrap {
    inner: DeepOptional;
}

contract TestContract {
    optWrap: Wrap?;

    init() {
        self.optWrap = Wrap{
            inner: DeepOptional{
                x: 7,
                y: null,
                z: null
            }
        };
    }
}