struct Alpha { x: Int; }
struct Beta { y: Bool; }

contract MultiStruct {
    one: Alpha;
    two: Beta;

    init() {
        self.one = Alpha{ x: 42 };
        self.two = Beta{ y: false };
    }
}