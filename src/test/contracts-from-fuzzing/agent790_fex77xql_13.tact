struct Alpha { x: Int; }
struct Beta { y: Alpha; }
struct Gamma { z: Beta; }

contract DeepThree {
    nested: Gamma;

    init() {
        self.nested = Gamma{z: Beta{y: Alpha{x: 123}}};
    }
}