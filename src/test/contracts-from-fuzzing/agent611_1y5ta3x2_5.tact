struct Mix {
    x: Int;
    y: Bool;
    z: String?;
    ad: Address?;
    cl: Cell;
}

contract HasNested {
    val: Mix;

    init() {
        self.val = Mix{
            x: 1,
            y: true,
            z: null,
            ad: null,
            cl: emptyCell()
        };
    }
}