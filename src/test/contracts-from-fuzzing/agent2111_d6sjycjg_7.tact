struct Layer3 {
    x3: Int;
    y3: Bool;
}

struct Layer2 {
    opt3: Layer3?;
}

struct Layer1 {
    opt2: Layer2?;
}

contract OptionalDeepNest {
    val: Layer1;

    init() {
        self.val = Layer1{
            opt2: Layer2{
                opt3: Layer3{
                    x3: 77,
                    y3: false
                }
            }
        };
    }
}