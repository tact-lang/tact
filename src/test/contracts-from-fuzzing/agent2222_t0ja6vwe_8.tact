struct CombinationA {
    x: Int;
    y: Bool?;
    z: String;
}

struct CombinationB {
    foo: CombinationA;
    bar: Int?;
}

contract TestContract {
    storage: CombinationB;

    init() {
        self.storage = CombinationB{
            foo: CombinationA{ x:1, y:null, z:"hey" },
            bar: null
        };
    }
}