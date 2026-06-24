struct ManyOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Int?;
    opt4: Int?;
    opt5: Int?;
    opt6: Int?;
    opt7: Int?;
    opt8: Int?;
    opt9: Int?;
    opt10: Int?;
}

contract TestStorage {
    options: ManyOptionals;

    init() {
        self.options = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
            opt7: null,
            opt8: null,
            opt9: null,
            opt10: null
        };
    }
}