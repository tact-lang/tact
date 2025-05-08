struct A {
    i: Int;
}

contract ManyRefs {
    r1: A;
    r2: A;
    r3: A;
    r4: A;
    r5: A;
    r6: A;
    r7: A;
    r8: A;
    init() {
        self.r1 = A{i:1}; self.r2 = A{i:2}; self.r3 = A{i:3}; self.r4 = A{i:4};
        self.r5 = A{i:5}; self.r6 = A{i:6}; self.r7 = A{i:7}; self.r8 = A{i:8};
    }
}