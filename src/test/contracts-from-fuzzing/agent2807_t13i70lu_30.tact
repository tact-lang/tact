struct MixDefOpt {
    a: Int = 3;
    b: Bool?;
    c: String = "abc";
}

contract MixedPartInit {
    val: MixDefOpt;
    init() {
        self.val = MixDefOpt{ b: true };
    }
}