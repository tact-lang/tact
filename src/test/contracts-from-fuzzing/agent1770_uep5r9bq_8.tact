struct Complex {
    id: Int;
    flag: Bool;
    owner: Address;
    data: Slice;
    desc: String;
}

contract StructWithMultipleTypes {
    info: Complex;

    init() {
        self.info = Complex{
            id: 7,
            flag: false,
            owner: myAddress(),
            data: emptyCell().asSlice(),
            desc: "ok"
        };
    }
}