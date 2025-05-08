struct MixDefaultOpt {
    a: Int = 3;
    b: Bool?;
    c: String = "x";
}

contract MixDefaultOptTest {
    s: MixDefaultOpt;

    init() {
        self.s = MixDefaultOpt{ b: null };
    }
}