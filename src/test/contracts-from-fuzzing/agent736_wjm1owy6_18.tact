struct OptionalDeep {
    maybe: Mid?;
}

struct Mid {
    probably: InnerMost?;
}

struct InnerMost {
    val: Int;
    text: String;
}

contract TestContract {
    od: OptionalDeep = OptionalDeep{maybe:null};

    init() {
        self.od = OptionalDeep{maybe:null};
    }

    receive() {
        dump(self.od.maybe == null);
    }
}