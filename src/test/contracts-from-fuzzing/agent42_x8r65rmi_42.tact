struct InnerS {
    x: Int;
    y: Bool?;
}

struct OuterS {
    inner: InnerS?;
    z: String;
}

contract OptStructInOptStruct {
    data: OuterS?;

    init() {
        self.data = OuterS{
            inner: null,
            z: "hi"
        };
    }
}