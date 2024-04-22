import "@stdlib/deploy";

struct S {
    v1: Int;
    v2: Int;
    v3: Int;
}

mutates extends fun inc(self: Int): Int {
    self = self + 1;
    return self;
}

contract A with Deployable {

    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }

    get fun create(v: Int): S {
        return S{v3: v.inc(), v2: v.inc(), v1: v.inc()}; // NOTE: Inverted order!
    } 
}

contract B with Deployable {

    get fun create(v: Int): S {
        let v1: Int = v.inc();
        let v2: Int = v.inc();
        let v3: Int = v.inc();
        
        return S{ v1, v2, v3 };
    } 
}
