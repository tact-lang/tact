struct Nested1 {
    n: Int;
}

struct Nested2 {
    nn: Nested1;
}

struct Nested3 {
    nnn: Nested2;
}

struct Nested4 {
    nnnn: Nested3;
}

struct Nested5 {
    nnnnn: Nested4;
}

contract DeepStruct {
    data: Nested5;

    init() {
        self.data = Nested5{
            nnnnn: Nested4{
                nnnn: Nested3{
                    nnn: Nested2{
                        nn: Nested1{
                            n: 42
                        }
                    }
                }
            }
        };
    }
}