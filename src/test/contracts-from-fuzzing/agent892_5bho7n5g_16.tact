struct Alpha {
    number: Int;
    text: String;
}

struct Beta {
    alpha: Alpha;
    flag: Bool;
}

struct Gamma {
    beta: Beta;
    note: String;
}

contract DeepParams {
    g: Gamma;

    init() {
        self.g = Gamma{
            beta: Beta{
                alpha: Alpha{number:5, text:"abc"},
                flag: true
            },
            note: "xyz"
        };
    }
}