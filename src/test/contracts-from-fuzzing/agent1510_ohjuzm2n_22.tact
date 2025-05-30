struct Nest {
    mini: Int as int3;   // 3 bits signed
    optVal: Int?;       // optional, default omitted
    flag: Bool = true;  // default specified
}

contract TestContract {
    n: Nest = Nest{mini: 3, optVal: null, flag: true};

    init() {
        self.n = Nest{mini: -3, optVal: null, flag: false};
    }

    receive() {
        let _ = self.n;
    }
}