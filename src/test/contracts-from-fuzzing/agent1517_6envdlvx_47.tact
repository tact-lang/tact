struct InnerMost { val: Int; }
message(11) InnerMsg { inner: InnerMost; }
struct Outer { msg: InnerMsg; flag: Bool; }

contract NestedMix {
    data: Outer;
    init() {
        self.data = Outer{
            msg: InnerMsg{ inner: InnerMost{ val: 42 } },
            flag: true
        };
    }
}