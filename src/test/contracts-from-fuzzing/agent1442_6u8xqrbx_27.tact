// large struct of mixed optionals, defaults, primitives
struct Mix {
    a: Int = 1; b: Int?; c: Bool = true; d: Bool?;
    e: String ="hi"; f: String?;
    g: Cell; h: Cell?;
    i: Slice; j: Slice?;
    k: Address; l: Address?;
}

contract TestContract {
    m: Mix;
    init() {
        self.m = Mix{
          b:null, d:null, f:null, h:null, j:null, l:null,
          g:emptyCell(), i:emptyCell().asSlice(), k:myAddress()
        };
    }
}