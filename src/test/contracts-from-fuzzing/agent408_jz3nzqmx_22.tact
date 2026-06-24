struct Pack {
    s: String;
    b: Bool;
    o: Int?;
}

contract DefaultNested {
    val: Pack = Pack{
        s: "x",
        b: false,
        o: null
    };

    init() {
        self.val = Pack { s: "y", b: true, o: null };
    }
}