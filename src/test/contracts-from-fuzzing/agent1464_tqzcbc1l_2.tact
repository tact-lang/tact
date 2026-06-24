struct DeepStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: NestedInner;
}

struct NestedInner {
    x: Int;
    y: Int?;
    z: Bool;
}

contract TestContract {
    deep: DeepStruct;

    init() {
        self.deep = DeepStruct{
            a: 1,
            b: null,
            c: true,
            d: NestedInner{
                x: 10,
                y: null,
                z: false
            }
        };
    }
}