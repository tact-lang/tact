struct Mix {
   a: Int;
   b: Bool;
}

contract InitOrder {
    x: Mix;

    init() {
        self.x = Mix{
            b: false,
            a: 42
        };
    }
}
