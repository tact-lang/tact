struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: AnotherLayer?;
}

struct AnotherLayer {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: DeeplyOptional;

    init() {
        self.data = DeeplyOptional{
            a: null,
            b: null,
            c: null
        };
    }
}