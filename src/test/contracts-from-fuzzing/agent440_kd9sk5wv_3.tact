struct Nest2 {
    beta: Int?;
    gamma: Bool?;
}

struct Nest1 {
    alpha: Int;
    nest2: Nest2;
}

contract NestedStructs {
    s: Nest1;

    init() {
        self.s = Nest1{
            alpha: 7,
            nest2: Nest2{
                beta: null,
                gamma: true,
            }
        };
    }

    receive() {}
}