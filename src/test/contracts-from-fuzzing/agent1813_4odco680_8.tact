struct WrapSlice { sl: Slice }

struct WrapOptBool { b: Bool? }

struct Mixed {
    i: Int; s: String; ws: WrapSlice; wob: WrapOptBool; x: Int?; y: String;
}

contract ComplexNested {
    st: Mixed;

    init() {
        self.st = Mixed{
            i: 7,
            s: "hello",
            ws: WrapSlice{ sl: emptyCell().asSlice() },
            wob: WrapOptBool{ b: null },
            x: null,
            y: "world"
        };
    }
}