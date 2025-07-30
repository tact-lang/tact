// Contract with optional persistent variable of a contract's own struct type

struct Info {
    val: Int;
    note: String?;
}

contract OptionalTopStruct {
    info: Info?;

    init() {
        self.info = Info{
            val: 10,
            note: null,
        };
    }
}