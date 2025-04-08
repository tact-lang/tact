struct Mixed {
    n: Int;
    alive: Bool;
    name: String;
    n_opt: Int?;
    flag_opt: Bool?;
    text_opt: String?;
}

contract OptionalsTest {
    data: Mixed;
    init() {
        self.data = Mixed{
            n: 1,
            alive: true,
            name: "me",
            n_opt: null,
            flag_opt: false,
            text_opt: "hi"
        };
    }
}