// Contract with struct with nested empty optional and defaulted struct
struct S1 {
    v: Int = 0;
}
struct S2 {
    nested: S1?;
}

contract NestedDefaultsOpt {
    x: S2;

    init() {
        self.x = S2{nested:null};
    }
}
