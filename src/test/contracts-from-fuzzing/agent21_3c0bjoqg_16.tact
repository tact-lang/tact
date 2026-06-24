struct TupleLike {
    first: Int;
    second: Bool;
    third: String;
}

contract TestContract {
    x: Int;
    y: Bool;
    z: TupleLike;

    init() {
        self.x = 13;
        self.y = true;
        self.z = TupleLike{
            first: 1,
            second: false,
            third: "yo"
        };
    }
}