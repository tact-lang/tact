struct Recursive1 {
    f: Recursive2?;
}

struct Recursive2 {
    g: Recursive3?;
}

struct Recursive3 {
    h: Int;
}

contract ChainOptionalRecursion {
    chain: Recursive1;

    init() {
        self.chain = Recursive1{
            f: Recursive2{
                g: Recursive3{
                    h: 42
                }
            }
        };
    }
}