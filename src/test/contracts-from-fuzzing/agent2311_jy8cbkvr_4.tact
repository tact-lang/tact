struct Layer3 {
    flag: Bool;
}

struct Layer2 {
    lay3: Layer3;
    val: String;
}

struct Layer1 {
    lay2: Layer2;
    num: Int;
}

contract DeepNest {
    data: Layer1;

    init() {
        self.data = Layer1{
            lay2: Layer2{
                lay3: Layer3{ flag: true },
                val: "deepdeep"
            },
            num: 42
        };
    }
}