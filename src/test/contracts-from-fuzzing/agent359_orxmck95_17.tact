struct MixOptional {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    data: MixOptional;

    init() {
        self.data = MixOptional{
            a: 1, b: null, c: 2, d: true, e: "hi", f: null
        };
    }
}