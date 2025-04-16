struct W {
    nested: X?;
}

struct X {
    in1: Int;
    in2: Bool;
    in3: Address;
    in4: String;
}

contract EdgeCase {
    val: W = W{ nested: null };

    init() {
        self.val = W{
            nested: X{
                in1: 42,
                in2: true,
                in3: myAddress(),
                in4: "hello"
            }
        };
    }
}