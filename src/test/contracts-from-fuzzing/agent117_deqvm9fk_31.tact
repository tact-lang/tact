struct NestedA { a: Int }
struct NestedB { b: Bool }

contract ManyNested {
    n1: NestedA;
    n2: NestedB;
    n3: NestedA;
    n4: NestedB;
    n5: NestedA;
    n6: NestedB;
    n7: NestedA;
    n8: NestedB;

    init() {
        self.n1 = NestedA{a:1};
        self.n2 = NestedB{b:true};
        self.n3 = NestedA{a:2};
        self.n4 = NestedB{b:false};
        self.n5 = NestedA{a:3};
        self.n6 = NestedB{b:true};
        self.n7 = NestedA{a:4};
        self.n8 = NestedB{b:false};
    }
}
