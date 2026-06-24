struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: String?;
}

contract TestContract {
    data: ManyOptionals = ManyOptionals{
        opt1: null,
        opt2: null,
        opt3: null,
        opt4: null,
        opt5: null,
        opt6: null
    };

    init() {
        self.data = ManyOptionals {
            opt1: 1,
            opt2: true,
            opt3: myAddress(),
            opt4: emptyCell(),
            opt5: emptyCell().asSlice(),
            opt6: "hi"
        };
    }
}
