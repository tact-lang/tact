struct Combined { 
    counter: Int; 
    mapping: map<Int, Int>;
}

contract TestGetterCombined {
    combined: Combined;

    init() {
        let m: map<Int, Int> = emptyMap();
        m.set(3, 300);
        self.combined = Combined { counter: 10, mapping: m };
    }

    receive() {}

    get fun getCombined(): Combined {
        return self.combined;
    }
}
