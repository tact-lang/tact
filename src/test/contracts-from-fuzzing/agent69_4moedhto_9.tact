struct ChainNested {
    next: NextStruct?;
}

struct NextStruct {
    next: NextStruct2?;
}

struct NextStruct2 {
    next: NextStruct3?;
}

struct NextStruct3 {
    next: NextStruct4?;
}

struct NextStruct4 {
    val: Int;
}

contract ChainNestedTest {
    chain: ChainNested;

    init() {
        self.chain = ChainNested{
            next: NextStruct{
                next: NextStruct2{
                    next: NextStruct3{
                        next: NextStruct4{val: 99}
                    }
                }
            }
        };
    }
}