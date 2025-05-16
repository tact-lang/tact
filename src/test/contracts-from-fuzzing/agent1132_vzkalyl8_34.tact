struct Compose {
    id: Int;
    enabled: Bool;
    comment: String;
}

contract MultipleInit {
    x: Compose;
    y: Compose;

    init() {
        self.x = Compose{id: 1, enabled: true, comment: "x"};
        self.y = Compose{id: 2, enabled: false, comment: "y"};
    }
}