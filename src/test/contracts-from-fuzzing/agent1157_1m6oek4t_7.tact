struct Level {
    l1: Int;
}

struct Nested {
    inner: Level?;
    flag: Bool;
}

contract MultiMixedTest {
    alpha: Int;
    beta: Int?;
    gamma: String;
    delta: Nested;
    epsilon: Nested?;

    init() {
        self.alpha = 1;
        self.beta = null;
        self.gamma = "test";
        self.delta = Nested{ inner: null, flag: true };
        self.epsilon = null;
    }

    receive() {
        let a = self.alpha;
        let b = self.beta;
        let c = self.gamma;
        let d = self.delta;
        let e = self.epsilon;
    }
}