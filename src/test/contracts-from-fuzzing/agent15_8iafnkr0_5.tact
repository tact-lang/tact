struct WrapMap {
    m: map<Int, Int>;
}

struct Complex {
    optWrap: WrapMap?;
}

contract Test {
    comp: Complex;

    init() {
        self.comp = Complex{
            optWrap: null,
        };
    }
}