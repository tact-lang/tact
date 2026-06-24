struct Alpha {
    num1: Int;
    num2: Int;
    flag: Bool;
}

struct Beta {
    alpha: Alpha;
    text: String;
    optFlag: Bool?;
}

struct Gamma {
    beta: Beta;
    note: String?
}

contract TestContract {
    g: Gamma;
    init() {
        self.g = Gamma{
            beta: Beta{
                alpha: Alpha{ num1: 10, num2: 20, flag: true },
                text: "Hello",
                optFlag: null
            },
            note: null
        };
    }
}