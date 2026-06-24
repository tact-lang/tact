struct Alpha {
    x: Int;
}

struct Beta {
    a: Alpha;
}

struct Gamma {
    b: Beta;
}

contract MultiLevelStructContract {
    g: Gamma;

    init() {
        self.g = Gamma{
            b: Beta{
                a: Alpha{ x: 33 }
            }
        };
    }

    receive(){}
}