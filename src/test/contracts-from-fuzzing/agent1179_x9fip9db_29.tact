struct Rec1 {
    val: Int;
    opt: Rec2?;
}

struct Rec2 {
    name: String;
    flag: Bool?;
}

contract RecurseOpt {
    data: Rec1;

    init() {
        self.data = Rec1{
            val: 42,
            opt: null
        };
    }

    receive() {}
}