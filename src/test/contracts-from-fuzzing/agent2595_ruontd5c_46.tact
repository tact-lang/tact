struct ContradictDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultsOverride {
    vars: ContradictDefaults;

    init() {
        self.vars = ContradictDefaults{a:10,b:20,c:30};
    }
}