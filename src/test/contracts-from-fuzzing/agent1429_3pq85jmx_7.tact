struct Layer1 { 
    val: Int;
    opt: Int?;
}

struct Layer2 {
    l1: Layer1;
    extra: String?;
}

struct Layer3 {
    l2: Layer2;
}

contract DeepContract {
    deep: Layer3;

    init() {
        self.deep = Layer3{
            l2: Layer2{
                l1: Layer1{ val: 5, opt: null },
                extra: "hi"
            }
        };
    }
}