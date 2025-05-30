struct Reversed {
    x: Int;
    y: Bool;
    z: String;
}

contract ReverseInit {
    val: Reversed;
    init() {
        self.val = Reversed{
            z: "Z",
            y: true,
            x: 123
        };
    }
}