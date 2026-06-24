struct MixedTypes {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{ a:123, b:null, c:"text" };
    }
}