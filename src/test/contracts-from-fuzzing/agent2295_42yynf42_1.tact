struct ManyOptionals {
    foo: Int?;
    bar: String?;
    flag: Bool?;
    optAddress: Address?;
    optCell: Cell?;
}

contract Test {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            foo: null,
            bar: null,
            flag: true,
            optAddress: null,
            optCell: null
        };
    }
}