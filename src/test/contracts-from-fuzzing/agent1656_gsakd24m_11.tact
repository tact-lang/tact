struct First {
    x: Int;
}

struct Second {
    first: First;
}

struct Third {
    second: Second;
}

struct Fourth {
    third: Third;
}

contract DeepNest4 {
    data: Fourth;

    init() {
        self.data = Fourth{
            third: Third{
                second: Second{
                    first: First{
                        x: 123
                    }
                }
            }
        };
    }
}