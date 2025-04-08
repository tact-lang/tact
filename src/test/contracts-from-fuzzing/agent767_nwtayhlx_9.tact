struct Info {
    num: Int;
    msg: String;
}

struct Holder {
    maybe1: Info?;
    maybe2: Info?;
}

contract OptionalNested {
    data: Holder;

    init() {
        self.data = Holder{
            maybe1: Info{ num: 10, msg: "ten" },
            maybe2: null
        };
    }
}
