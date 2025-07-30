struct Layer3 {
    val3: Int?;
}

struct Layer2 {
    val2: Layer3;
}

struct Layer1 {
    val1: Layer2;
}

contract DeeplyNestedOptional {
    foo: Layer1;

    init() {
        self.foo = Layer1{
            val1: Layer2{
                val2: Layer3{
                    val3: null
                }
            }
        };
    }
}