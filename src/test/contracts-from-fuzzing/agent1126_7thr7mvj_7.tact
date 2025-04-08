struct MyStruct {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;
}

contract StructContract {
    data: MyStruct;

    init() {
        self.data = MyStruct{
            i: 1,
            b: true,
            s: "s",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
            oi: 42,
            ob: false,
            os: "opt",
            oc: emptyCell(),
            osl: emptyCell().asSlice(),
            oa: myAddress(),
        };
    }

    receive() {
        let add: Int = 0;
        if (self.data.b) {
            add = 1;
        } else {
            add = 0;
        }
        let _ = self.data.i + add;
        let _ = self.data.s;
        let _ = self.data.c;
        let _ = self.data.sl;
        let _ = self.data.a;

        if (self.data.oi != null) {
            let _ = self.data.oi!!;
        }
        if (self.data.ob != null) {
            let bool_val: Int = 0;
            if (self.data.ob!!) {
                bool_val = 1;
            } else {
                bool_val = 0;
            }
            let _ = bool_val;
        }
        if (self.data.os != null) {
            let _ = self.data.os!!;
        }
        if (self.data.oc != null) {
            let _ = self.data.oc!!;
        }
        if (self.data.osl != null) {
            let _ = self.data.osl!!;
        }
        if (self.data.oa != null) {
            let _ = self.data.oa!!;
        }
    }
}