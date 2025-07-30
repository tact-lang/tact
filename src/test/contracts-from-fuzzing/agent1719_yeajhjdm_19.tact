struct S { x: Int }

contract ListOfVars {
    v1: S;
    v2: S;
    v3: S;
    v4: S;
    v5: S;
    
    init() {
        self.v1 = S{x:1};
        self.v2 = S{x:2};
        self.v3 = S{x:3};
        self.v4 = S{x:4};
        self.v5 = S{x:5};
    }
}