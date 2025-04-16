struct InnerMost { val: Int; }
struct Inner { inner: InnerMost; opt: Int?; flag: Bool; text: String; }

contract OptNested {
    nested: Inner?;

    init() {
        self.nested = Inner{ inner: InnerMost{ val: 7 }, opt: null, flag: true, text: "xyz" };
    }
}