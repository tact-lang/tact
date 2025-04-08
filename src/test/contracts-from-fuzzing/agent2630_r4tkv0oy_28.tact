struct Layer3 {
    val3: Int;
}

struct Layer2 {
    val2: Int;
    next: Layer3;
}

struct Layer1 {
    val1: Int;
    next: Layer2;
}

contract NestThreeLayers {
    top: Layer1;

    init() {
        self.top = Layer1 {
            val1:1,
            next: Layer2 {
                val2:2,
                next: Layer3 { val3:3 }
            }
        };
    }
}