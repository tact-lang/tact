struct BoolNested {
    inner: BoolStruct;
}

struct BoolStruct {
    x: Bool;
    y: Bool?;
}

contract TestContract {
    b: BoolNested;

    init() {
        self.b = BoolNested{
            inner: BoolStruct{ x: true, y: null }
        };
    }
}