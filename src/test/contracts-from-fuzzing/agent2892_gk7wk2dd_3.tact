struct ManyOptionals {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    txt: String?;
}

contract OptsInStorage {
    val: ManyOptionals;
    init() {
        self.val = ManyOptionals{
            foo: null,
            bar: true,
            addr: null,
            txt: "hello"
        };
    }
}