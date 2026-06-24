struct Layer4 {
    val4: Int;
}

struct Layer3 {
    val3: Layer4;
}

struct Layer2 {
    val2: Layer3;
}

struct Layer1 {
    val1: Layer2;
}

contract VeryDeepStruct {
    root: Layer1;
    
    init() {
        self.root = Layer1{
            val1: Layer2{
                val2: Layer3{
                    val3: Layer4{
                        val4: 123
                    }
                }
            }
        };
    }
}