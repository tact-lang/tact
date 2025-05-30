struct Layer3 {
    inner: Layer4;
}

struct Layer4 {
    x: Int;
}

struct Layer2 {
    inner: Layer3;
}

struct Layer1 {
    inner: Layer2;
}

contract FourLevelDeep {
    d: Layer1;

    init() {
        self.d = Layer1{
            inner: Layer2{
                inner: Layer3{
                    inner: Layer4{ x: 123 }
                }
            }
        };
    }
}
