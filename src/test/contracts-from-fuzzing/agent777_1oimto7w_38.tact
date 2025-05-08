struct Innermost {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct MiddleOpt {
    inner: Innermost?;
    flag: Bool?;
    label: String?;
}

contract DeepOptionalLayers {
    data: MiddleOpt?;

    init() {
        self.data = MiddleOpt{
            inner: Innermost{
                x: null,
                y: true,
                z: null,
            },
            flag: null,
            label: null,
        };
    }
}