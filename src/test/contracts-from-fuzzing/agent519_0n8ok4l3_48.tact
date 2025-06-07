struct OptDeepNest {
    i: Int?;
    s: String?;
    b: Bool?;
}

struct OptLayer {
    inner: OptDeepNest?;
}

contract OptionalDeepLayer {
    data: OptLayer;

    init() {
        self.data = OptLayer {
            inner: null
        };
    }
}