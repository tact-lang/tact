struct MixDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Address;
    e: Cell;
    f: Bool?;
}

contract TestContract {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{
            d: myAddress(),
            e: emptyCell(),
            f: null
        };
    }
}