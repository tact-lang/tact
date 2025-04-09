struct OptComplex {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct ContainsOptComplex {
    inner: OptComplex?;
    k: Bool;
}

contract ComplexOptionalStorage {
    data: ContainsOptComplex;
    init() {
        self.data = ContainsOptComplex{
            inner: OptComplex{
                x: null,
                y: true,
                z: "hi"
            },
            k: false
        };
    }
}
