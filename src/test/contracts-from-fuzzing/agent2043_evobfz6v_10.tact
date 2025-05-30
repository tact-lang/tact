struct Mid {
    x: Int;
    y: Bool;
}

struct Top {
    a: Int;
    b: Mid;
    c: Bool;
}

contract ManyNested {
    arr1: Top;
    arr2: Top;
    arr3: Top;

    init() {
        self.arr1 = Top{a:1, b:Mid{x:1,y:true}, c:true};
        self.arr2 = Top{a:2, b:Mid{x:2,y:false}, c:false};
        self.arr3 = Top{a:3, b:Mid{x:3,y:true}, c:true};
    }
}
