struct Combo {
    x: Int;
    y: Bool?;
    z: String;
    k: Int?;
    t: Bool;
    s: String?;
}

contract TestContract {
    data: Combo = Combo{
        x: 1, y: null, z: "abc", k: null, t: true, s: null
    };

    init() {
        self.data = Combo{
            x: 9, y: true, z: "def", k: 11, t: false, s: "hello"
        };
    }
}