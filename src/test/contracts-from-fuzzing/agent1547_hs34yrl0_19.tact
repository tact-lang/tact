struct RC1 {
    next: RC2?;
}

struct RC2 {
    next: RC3?;
}

struct RC3 {
    val: Int;
}

contract RefChain {
    chain: RC1;

    init() {
        self.chain = RC1{
            next: RC2{
                next: RC3{
                    val: 100
                }
            }
        };
    }
}