struct Points {
    x: Int;
    y: Int;
}

struct User {
    name: String;
    score: Int;
    position: Points;
}

contract TestContract {
    player: User;

    init() {
        self.player = User{
            name: "Alex",
            score: 100,
            position: Points{ x: 1, y: 2 }
        };
    }
}