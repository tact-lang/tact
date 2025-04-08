struct Arranged {
    b: Bool; s: String; i: Int; optI: Int?; optS: String?;
}

contract OrderMatters {
    field: Arranged;

    init() {
        self.field = Arranged{
            b: false, s: "str", i: 1, optI: null, optS: "none"
        };
    }
}
