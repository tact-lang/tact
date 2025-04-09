struct Layer {
    inner: Layer2;
}

struct Layer2 {
    arr: Arr3;
}

struct Arr3 {
    d: Deep4;
}

struct Deep4 {
    last: Bool;
}

contract Test {
    data: Layer;

    init() {
        self.data = Layer{
            inner: Layer2{
                arr: Arr3{
                    d: Deep4{
                        last: true
                    }
                }
            }
        };
    }
}