message InnerMsg { foo: Int }

struct Wrapper { inner: InnerMsg }

contract MsgInStruct {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: InnerMsg{foo: 42}};
    }
}
