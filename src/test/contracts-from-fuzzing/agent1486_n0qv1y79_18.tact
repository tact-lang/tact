struct Repeater {
    a1: Int?;
    a2: Int?;
    a3: Int?;
    a4: Int?;
    a5: Int?;
    a6: Int?;
}

contract ArrayLikeStruct {
    data: Repeater;

    init() {
        self.data = Repeater{
            a1: null,
            a2: null,
            a3: null,
            a4: null,
            a5: null,
            a6: null,
        };
    }
}