message(123) Note {
    text: String;
}

struct ComplexOpt {
    main: String;
    optMsg: Note?;
}

contract OptMsgStructVar {
    data: ComplexOpt;

    init() {
        self.data = ComplexOpt{
            main: "hello",
            optMsg: null
        };
    }
}