struct Alpha { a: Int; }
struct Beta { b: Bool; }

contract MultiStructFields {
    first: Alpha;
    second: Beta;

    init() {
        self.first = Alpha{ a: 10 };
        self.second = Beta{ b: false };
    }
}