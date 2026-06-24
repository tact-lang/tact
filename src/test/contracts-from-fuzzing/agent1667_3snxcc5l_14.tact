struct A {
    x: Int;
    y: Bool;
}

struct B {
    p: Int;
    q: String;
    nested: A;
}

struct C {
    arr1: A;
    arr2: B;
    arr3: String;
    arr4: Cell;
    arr5: Slice;
    arr6: Bool;
}

contract TestContract {
    big: C;

    init() {
        self.big = C{
            arr1: A{x:1,y:true},
            arr2: B{p:2,q:"z",nested:A{x:3,y:false}},
            arr3: "test",
            arr4: emptyCell(),
            arr5: emptyCell().asSlice(),
            arr6: false
        };
    }
}