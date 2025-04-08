struct BigOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
    addr: Address? = null;
    c: Cell? = null;
    sl: Slice? = null;
}

contract BigOptionalDefaults {
    bod: BigOptDefaults = BigOptDefaults{};

    init() {
        self.bod = BigOptDefaults{
            a:5,b:true,s:"hi",addr:myAddress(),c:emptyCell(),sl:emptyCell().asSlice()
        };
    }

    receive() {
        let _ = self.bod.a != null ? self.bod.a!! : 0;
    }
}