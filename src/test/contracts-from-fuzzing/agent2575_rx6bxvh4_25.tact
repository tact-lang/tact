struct Chain1 {
    chain2: Chain2;
}

struct Chain2 {
    chain3: Chain3;
}

struct Chain3 {
    x: Int;
    y: Bool;
}

contract TestContract {
    val: Chain1 = Chain1{
        chain2: Chain2{
            chain3: Chain3{
                x: 123,
                y: true
            }
        }
    };
}