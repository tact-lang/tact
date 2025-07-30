// Testing persistent state variable with optional struct containing optionals

struct Wrap {
    value: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    val: Wrap;

    init() {
        self.val = Wrap {
            value: InnerOpt {
                a: null,
                b: true
            }
        };
    }
}