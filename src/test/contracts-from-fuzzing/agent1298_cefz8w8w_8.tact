struct Info {
    nickname: String?;
    score: Int?;
    title: String;
}

contract ComplexOptionals {
    info: Info;

    init() {
        self.info = Info{
            nickname: null,
            score: null,
            title: "Champion"
        };
    }
}