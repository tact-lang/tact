struct Alpha { a: Int }
struct Beta { b: Alpha }
struct Gamma { c: Beta }

contract Chain {
    val: Gamma;

    init() {
        self.val = Gamma{ c: Beta{ b: Alpha{ a: 1 } } };
    }
}