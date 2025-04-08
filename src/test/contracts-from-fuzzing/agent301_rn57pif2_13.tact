struct Info {
    text: String?;
    flag: Bool;
}

struct Score {
    points: Int;
}

contract TestContract {
    info: Info;
    score: Score;

    init() {
        self.info = Info{
            text: null,
            flag: true
        };
        self.score = Score{
            points: 42
        };
    }

    receive() {
        let _ = self.score.points;
    }
}