struct Alpha { a: Int; b: Int?; c: String }

contract Foo {
    alpha: Alpha;

    init() {
        self.alpha = Alpha{ a: 5, b: null, c: "hello" };
    }
}