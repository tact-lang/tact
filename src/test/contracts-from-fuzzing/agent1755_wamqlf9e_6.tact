struct Deep1 { f1: Int; opt: Int?; txt: String; }
struct Deep2 { inner: Deep1; flag: Bool; }
struct Deep3 { nested: Deep2; s: String; }
contract DeeplyNested {
    deep: Deep3;
    init() {
        self.deep = Deep3{
            nested: Deep2{
                inner: Deep1{
                    f1: 42,
                    opt: null,
                    txt: "hi"
                },
                flag: true
            },
            s: "done"
        };
    }
}