struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct UseDeep {
    f: DeepOptional?;
}

contract TestContract {
    data: UseDeep;

    init() {
        self.data = UseDeep{
            f: DeepOptional{
                x: 5,
                y: null,
                z: null
            }
        };
    }
}