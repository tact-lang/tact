struct MultiNestedOpt {
    a: Int?;
    b: Bool?;
    c: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract LayeredOptionals {
    data: MultiNestedOpt;

    init() {
        self.data = MultiNestedOpt{
            a:null, b:null, c:null
        };
    }
}