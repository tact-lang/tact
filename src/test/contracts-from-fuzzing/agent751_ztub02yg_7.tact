struct Info {
    number: Int;
    flag: Bool;
}

struct Complex {
    val: Int?;
    msg: String;
    small: Info;
    smaybe: Info?;
    someSlice: Slice?;
    addr: Address;
    cell: Cell?;
}

contract MixedWideDeep {
    data: Complex;

    init() {
        self.data = Complex{
            val: null,
            msg: "hi",
            small: Info{number:1, flag:true},
            smaybe: null,
            someSlice: null,
            addr: myAddress(),
            cell: null
        };
    }
}