struct Layer1 {
    inner: Layer2;
}

struct Layer2 {
    inner: Layer3;
}

struct Layer3 {
    inner: Layer4;
}

struct Layer4 {
    inner: Layer5;
}

struct Layer5 {
    val: Int;
}

contract DeepLayers {
    data: Layer1;
    init() {
        self.data = Layer1{
            inner: Layer2{
                inner: Layer3{
                    inner: Layer4{
                        inner: Layer5{ val: 42 }
                    }
                }
            }
        };
    }
}