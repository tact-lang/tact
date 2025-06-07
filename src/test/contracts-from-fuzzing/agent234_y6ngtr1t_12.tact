struct First {
    a: Int;
    b: String;
}
struct Second {
    c: Bool;
    d: Address;
}
struct Third {
    e: Bool?;
    f: String?;
}

contract ThreeStructContract {
    x: First;
    y: Second;
    z: Third;

    init() {
        self.x = First{a:1, b:"A"};
        self.y = Second{c:true, d:myAddress()};
        self.z = Third{e:null, f:null};
    }
}